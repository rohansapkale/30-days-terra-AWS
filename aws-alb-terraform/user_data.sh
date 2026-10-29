#!/bin/bash
set -eux

dnf install -y nginx

cat > /usr/share/nginx/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head><title>Terraform ALB Lab</title></head>
<body>
<h1>Terraform EC2 + ALB Lab</h1>
<p>Infrastructure provisioned using Terraform.</p>
<p>Hostname: $(hostname)</p>
</body>
</html>
HTML

systemctl enable --now nginx