# VPC:
1. Create: `cd terraform && terraform init && terraform apply -auto-approve && cd ../`
2. Destroy: `cd terraform && terraform init && terraform destroy -auto-approve && cd ../`
3. Check: `curl http://alblink`
# Python:
1. Build: `sudo docker build -t mozart89/sam ./python/`
2. Run: `sudo docker run -d -p 8000:8000 mozart89/sam`
3. Check: `curl http://localhost:8000`
# CI/CD:
1. `.github/workflows/docker-image.yml`
2. Check: [https://github.com/m0zart89/sam/actions](https://github.com/m0zart89/sam/actions)
