#!/bin/bash -xe
hostnamectl set-hostname terraform-apache-t2-micro
yes|sudo apt update
yes|sudo apt install apache2
#sudo sed -i 's/Listen 80/Listen 443/g' /etc/apache2/ports.conf
sudo chmod 777 -R /var/www/html/*

echo """<p>Essa p&aacute;gina foi criada como <strong>DEMO</strong>, para cria&ccedil;&atilde;o de um Ambiente na <strong>AWS</strong>, utilizando o terraform, hostname $(hostname).</p>
<p>Link do meu Github <a href="https://github.com/waltenne">https://github.com/waltenne</a></p>
<p>Link do Reposit&oacute;rio <a href="https://github.com/waltenne/learning-terraform">https://github.com/waltenne/learning-terraform</a></p>
<p><iframe src="//www.youtube.com/embed/xXcKSLijghs" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>
<p>&nbsp;</p>""" > /var/www/html/index.html

sudo service apache2 restart


sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb -o /tmp/amazon-cloudwatch-agent.deb
sudo dpkg -i -E /tmp/amazon-cloudwatch-agent.deb
sudo apt-get install -y -f
sudo service amazon-cloudwatch-agent start
sudo rm /tmp/amazon-cloudwatch-agent.deb

