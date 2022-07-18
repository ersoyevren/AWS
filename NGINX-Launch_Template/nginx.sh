# Hands-on EC2-02 : How to Install Nginx Web Server on EC2 Linux 2

Purpose of the this hands-on training is to give the students basic knowledge of how to install Nginx Web Server on Amazon Linux 2 EC2 instance.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- demonstrate their knowledge of how to launch AWS EC2 Instance.

- establish a connection with AWS EC2 Instance with SSH.

- install the Nginx Server on Amazon Linux 2 Instance.

- configure the Nginx Server to run simple HTML page.

- write a simple bash script to run the Web Server

- automate the process of installation and configuration of a Web Server using the `user-data` script of EC2 Instance.

## Outline

- Part 1 - Launching an Amazon Linux 2 EC2 instance and Connect with SSH

- Part 2 - Installing and Configuring Nginx Web Server to Run a Simple Web Page

- Part 3 - Automation of Web Server Installation through Bash Script

## Part 1 - Launching an Amazon Linux 2 EC2 instance and Connect with SSH

-1.  Launch an Amazon 2 (one for spare)EC2 instance with AMI as `Amazon Linux 2`, instance type as `t2.micro` and default VPC security group which allows connections from anywhere and any port.

0. Connect to your instance with SSH.


ssh -i [Your Key pair] ec2-user@[Your EC2 IP / DNS name]




