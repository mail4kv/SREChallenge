<b>Introduction</b>

  This project involves building a running web server instance in `Amazon Web Services` and deploying a simple html application on it using ansible tool.
  
<b>Creating an instance in AWS:</b>
	
Here are steps to be followed to create a running instance in AWS.

•	Create an AWS account if not already exist
•	Login to the AWS console using your credentials.

https://aws.amazon.com/
•	Go to Services tab and select EC2 under Compute group.
•	Follow the simple instructions specified in console or refer `amazon EC2` to create an amazon EC2 instance.

<b>Security:</b>

	In order to secure the application from public access, you need to generate a SSL certificate and update apache configuration to reflect it. We generated a self signed certificate and updated apache configuration as below.

<VirtualHost ec2-13-58-26-246.us-east-2.compute.amazonaws.com:443>
DocumentRoot /var/www/html/sample/
SSLEngine  on
SSLCertificateFile /etc/httpd/conf/mysitename.crt
SSLCertificateKeyFile /etc/httpd/conf/mysitename.key
</VirtualHost>

<b>Deployment:</b>

Once you have the instance created, just run the ansible script using anisble playbook as below.

`ansible-playbook –I ansible_hosts challenge.yml`

This will install the web server, copies all dependencies such configuration file, certs, keys and deploys the html application on it.

<b>Testing:</b>

	The ansible script will invokes a shell script to validate the server configurations and the application accessibility.


	

        
 
