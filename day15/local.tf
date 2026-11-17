
locals {
  primary_user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2

    echo "<h1>Primary VPC Instance-${var.primary}</h1>" > /var/www/html/index.html
    echo "<p>Private IP: $(hostname -I | awk '{print $1}')</p>" >> /var/www/html/index.html
  EOF

  secondary_user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2

    echo "<h1>Secondary VPC Instance-${var.secondary}</h1>" > /var/www/html/index.html
    echo "<p>Private IP: $(hostname -I | awk '{print $1}')</p>" >> /var/www/html/index.html
  EOF
}
