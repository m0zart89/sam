import datetime
from http.server import BaseHTTPRequestHandler, HTTPServer


class S(BaseHTTPRequestHandler):
    def _set_response(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/html")
        self.end_headers()

    def do_GET(self):
        self._set_response()
        self.wfile.write(bytes((datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")).encode('utf-8')))


def run(server_class=HTTPServer, handler_class=S):
    server_address = ("0.0.0.0", 8000)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()


if __name__ == '__main__':
    run()
