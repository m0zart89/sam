# Create Launch config
resource "aws_launch_configuration" "nginx-config" {
  name_prefix     = "my-nginx-config"
  image_id        = var.ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_sg.id]

  root_block_device {
    volume_type = "gp2"
    volume_size = 10
    encrypted   = true
  }

  lifecycle {
    create_before_destroy = true
  }
  user_data = filebase64("${path.module}/init_webserver.sh")
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "asg1" {
  name                 = "my-asg"
  desired_capacity     = 2
  max_size             = 2
  min_size             = 1
  force_delete         = true
  depends_on           = [aws_lb.alb1]
  target_group_arns    = [aws_lb_target_group.tg1.arn]
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.nginx-config.name
  vpc_zone_identifier  = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
}

# Create Target group
resource "aws_lb_target_group" "tg1" {
  name       = "my-targetgroup"
  depends_on = [aws_vpc.main]
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.main.id
  health_check {
    interval            = 70
    path                = "/index.html"
    port                = 80
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 60
    protocol            = "HTTP"
    matcher             = "200,202"
  }
}

# Create ALB
resource "aws_lb" "alb1" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
}

# Create ALB Listener
resource "aws_lb_listener" "listener1" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

output "elb-dns-name" {
  value = aws_lb.alb1.dns_name
}