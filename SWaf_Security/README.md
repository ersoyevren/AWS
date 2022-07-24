# Hands-on Security WAF : Working with AWS WAF and Application Load Balancers

Purpose of this hands-on training is to get exposure to AWS WAF.  We'll cover how to attach WAF Web ACLs to an Application Load Balancer
and prevent undesired traffic getting through to servers behind the WAF.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- create an Application Load Balancer and it's components

- create AWS WAF ACLs

- attach a WAF ACL to a Load Balancer

- limit traffic getting through to the servers behind a load balancer

## Outline

- Part 1 - Create an Application Load Balancer and a web server behind it

- Part 2 - Explore rules for AWS WAF

- Part 3 - Create an ACL to block a single IP

- Part 4 - Create an ACL to block repeated requests from the same IP


## Part 1 - Build an Application (Security Group, ALB, Web Servers)

`### Step 1 - Create a Security Group:`

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/

- Choose Security Groups on the left-hand menu

- Click the "Create Security Group" tab.

```text
Security Group Name : ALB-EC2-SG
Description         : ALB and EC2 Security Group
VPC                 : Default VPC
Inbound Rules:
    - Type: SSH  ---> Source: Anywhere
    - Type: HTTP ---> Source: Anywhere
Outbound Rules: Keep it as it is
Tag:
    - Key   : Name
      Value : ALB-EC2-SG
```

`### Step 2 - Create a Web Server:`

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/

- Choose Instances on the left-hand menu

- Click on 'Launch Instances'

```text
- Amazon Machine Image (AMI):   Amazon Linux 2 AMI (HVM), SSD Volume Type
- Instance Type:                t2.micro
- Network:                      Select your default VPC
- Subnet:                       Select a public subnet
- Auto-assign Public IP:        Enabled
- User data:                    Paste the text from the script below
```
```bash
#!/bin/bash -x

#update os
yum update -y

#install apache server
yum install -y httpd

# create a custom index.html file
chmod -R 777 /var/www/html
echo "<html>
<head>
    <title> Web Server Running in AWS</title>
</head>
<body>
    <h1>This web server is protected by AWS WAF</h1>
</body>
</html>" > /var/www/html/index.html

# start apache server
systemctl start httpd
systemctl enable httpd
```
```text
Storage:            select the default (Volume 1 (AMI Root) (8 GiB, EBS, General purpose SSD (gp2)))
Tags:
    Key:            Name
    Value:          Web-Server
Security Group:     Select the security group created above named ALB-EC2-SG
```

- Launch the EC2 instance with your key-pair

`### Step 3 - Create a Target Group:`

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/

- Choose Target Groups on the left-hand menu

- Click on 'Create Target Group'

- **Basic Configuration**
```text
Target Type:        Instances
Target group name:  MyTargetGroup
Protocol:           HTTP
Port:               80
Protocol Version:   HTTP1
```

- **Health Checks**
```text
Use Defaults
```

- Click Next

- **Register Targets**
```text
- Select the instance you created above
- Click on 'Include as pending below'
```

- Click 'Create target group'



`### Step 4 - Create an Application Load Balancer:`

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/

- Choose Load Balancers on the left-hand menu

- Click on 'Create Load Balancer'

- Select 'Create' under Application Load Balancer

- **Basic Configuration**
```text
Load balancer name: MyLoadBalancer
Scheme:             Internet Facing
IP Address Type:    IPV4
```

- **Network Mapping**
```text
VPC:                Select your default VPC (same as that selected for EC2 instance above)
Mappings:           Select all availability zones
```

- **Security Groups**
```text
Security Groups:    Select the security group created above named ALB-EC2-SG (delete any others)
```

- **Listeners and Routing**
```text
Protocol:           HTTP
Port:               80
Default Action:     Forward to MyTargetGroup (target group created above)
```

- Click on Create Load Balancer


`### Step 5 - Check that you can access your Web Server:`

- Use the DNS name under the EC2 console and copy the name into a browser using http; i.e. http://dns-name

- Go to the load balancer console and ensure your load balancer is in the 'active state'

- Select the load balancer DNS and enter the name into a browswer using http; i.e. http://load-balancer-dns-name

- Both URLs should show you the same web page


