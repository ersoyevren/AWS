# Hands-on : Route 53- 02

Purpose of the this hands-on training is to creating a DNS record sets and implement Route 53 routing policies. 


## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- create record sets

- manage the domain name routing

- implement routing policies in different use case

- use active-passive architecture in local vpc

## Outline

- Part 1 - Prep.

- Part 2 - Creating a fail-over routing policies

- Part 3 - Creating a geolocation routing policies

- Part 4- Creating Private Hosted Zone and records

## Part 1 - Part 1 - Prep.

### STEP 1: Create Sec.Group:
```bash
   Route 53 Sec: In bound : "SSH 22, HTTP 80  > anywhere(0:/00000)"
```
### STEP 2: Create Instances:

- We'll totally create "4 Linux" instances and "1 Windows" instance.
   
1. Create EC2 in default VPC as named  "N.virginia_1"
```bash
Region: "N.Virginia"
VPC: Default VPC
Subnet: PublicA
Sec Group: "Route 53 Sec"

user data: 

#!/bin/bash

yum update -y
yum install -y httpd
yum install -y wget
cd /var/www/html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/N.virginia_1/index.html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/N.virginia_1/N.virginia_1.jpg
systemctl start httpd
systemctl enable httpd


2. Create EC2 in default VPC as named "Geo-Japon"

```bash
Region: "N.Virginia"
VPC: Default VPC
Subnet: PublicA
Sec Group: "Route 53 Sec"

   user data:
```
```bash

#!/bin/bash

yum update -y
yum install -y httpd
yum install -y wget
cd /var/www/html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/geo-japon/index.html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/geo-japon/Tsubasa.jpg
systemctl start httpd
systemctl enable httpd

```

3. Create EC2 in default VPC as named "Geo-Frankfurt"

 ```bash 
Region: "N.Virginia"
VPC: Default VPC
Subnet: PublicA
Sec Group: "Route 53 Sec"

user data:

#!/bin/bash

yum update -y
yum install -y httpd
yum install -y wget
cd /var/www/html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/frankfurt/index.html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/frankfurt/frankfurt.jpg
systemctl start httpd
systemctl enable httpd
```

4. Create EC2 in VPC of  "clarus-vpc-a" named "Local"

```bash 
Region: "N.Virginia"
VPC: 'clarus-vpc-a'-public 
Subnet: PublicA
Sec Group: ssh-http---->0.0.0.0/0

user data:

#!/bin/bash

yum update -y
yum install -y httpd
yum install -y wget
chkconfig httpd on
cd /var/www/html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/local/index.html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/local/Local.jpg
service httpd start

```
4. Create "Windows" instance in VPC of  "clarus-vpc-a" named "Windows"

```bash 
Region: "N.Virginia"
VPC: 'clarus-vpc-a'-public
Subnet: PublicA
Sec Group: RDP---->0.0.0.0/0

```

### STEP 3: Create a Static WebSite Hosting :(or use existing one from former session)

 1. Create Static WebSite Hosting-1/ "www.[your sub-domain name].net"
 
  - Go to S3 service and create a bucket with sub-domain name: "www.[your sub-domain name].net"
  - Public Access "Enabled"
  - Upload Files named "index.html" and "sorry.jpg"
  - Permissions>>> Bucket Policy >>> Paste bucket Policy
```bash
{
    "Version": "2012-10-17", 
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::don't forget to change me/*"
        }
    ]
}

```
  - Properties>>> Set Static Web Site >>> Enable >>> Index document : index.html 
   
