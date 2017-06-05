## Introduction

  This project involves building a running web server instance in `Amazon Web Services` and deploying a simple html application on it using ansible tool.
  
## Creating an instance in AWS:
	
Here are steps to be followed to create a running instance in AWS.

* Create an AWS account if not already exist
* Login to the AWS console using your credentials.

	https://aws.amazon.com/

* Go to Services tab and select EC2 under Compute group.
* Follow the simple instructions specified in console or refer `amazon EC2` to create an amazon EC2 instance.

## Security:

	In order to secure the application from public access, you need to generate a SSL certificate and update apache configuration to reflect it. We generated a self signed certificate and updated apache configuration as below.

```
<VirtualHost ec2-13-58-188-253.us-east-2.compute.amazonaws.com:443>
	DocumentRoot /var/www/html/sample/
	SSLEngine  on
	SSLCertificateFile /etc/httpd/conf/mysitename.crt
	SSLCertificateKeyFile /etc/httpd/conf/mysitename.key
</VirtualHost>
```
We need to make entry of the below configuration in `httpd.conf` to redirect http requests to https.

```
<VirtualHost *:80>
    	ServerName ec2-13-58-188-253.us-east-2.compute.amazonaws.com
     	Redirect / https://ec2-13-58-188-253.us-east-2.compute.amazonaws.com
</VirtualHost> 
```

## Deployment:

Once you have the instance created, just run the ansible script using anisble playbook as below.

`ansible-playbook –i hosts sre_demo.yml`

	This will install the web server, copies all dependencies such configuration file, certs, keys and deploys the html application on it.

## Testing:

	The ansible script will executes a shell script `hello.sh` to validate the server configurations and the application accessibility.


	

        
 
