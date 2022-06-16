## Part 2 - Creating Bastion Host and connect to the private subnet from internet

- discuss about how to connect to the "clarus-az1b-private-subnet" instance

- Explain logic of why we need Bastion Host?

- Launch two Instance. One is in Private Subnet-1b, the other one is in Public Subnet-1b

- Configure Private instance.

```text
AMI             : Amazon Linux 2
Instance Type   : t2.micro
Network         : clarus-vpc-a
Subnet          : clarus-az1b-private-subnet
Security Group  : 
    Sec.Group Name : Private Sec.group
    Rules          : TCP --- > 22 ---> Anywhere
                     All ICMP IPv4  ---> Anywhere
Tag             :
    Key         : Name
    Value       : Private EC2
```
- show that you can't connect directly to private instance from local with ssh connection.

- Configure Public instance (Bastion Host).

```text
AMI             : Amazon Linux 2
Instance Type   : t2.micro
Network         : clarus-vpc-a
Subnet          : clarus-az1b-public-subnet
Security Group  : 
    Sec.Group Name : Public Sec.group(Bastion Host)
    Rules          : TCP --- > 22 ---> Anywhere
                   : All ICMP IPv4  ---> Anywhere
Tag             :
    Key         : Name
    Value       : Public EC2 (Bastion Host)
```

- This configuration adds an extra layer of security and can also be used.
```text
Rules        : TCP --- > 22 ---> Anywhere
                |         |         |
                |         |         |
                V         V         V
               TCP --- > 22 ---> Public Sec.Group
``` 
- Try to connect private instance via ssh
  (As you see in the dashboard there is no public IP for instance)

- Since there is no public IP of private instance, we need to connect ssh via Bastion Host instance

- go to your local terminal

- add your private key to the ssh agent on your `localhost`. ``ssh-agent is a program that runs in background and stores your keys in memory`.

- Enable ssh-agent (start the ssh-agent in the background)

```bash
eval "$(ssh-agent)"
```
-  Add the your private ssh key to the ssh-agent.

```bash
ssh-add ./[your pem file name]
```
- connect to the ec2-in-az1b-public-sn instance in public subnet. 

- if we don't want to create a config file, we have another option, using -A flag with the ssh command. `-A` option `enables forwarding of the authentication agent connection`. It means that, it forwards your SSH auth schema to the remote host. So you can use SSH over there as if you were on your local machine.

```bash
ssh -A ec2-user@ec2-3-88-199-43.compute-1.amazonaws.com
```
- once logged into the ec2-in-az1b-public-sn (bastion host/jump box), connect to 
the ec2-in-az1b-private-sn instance in the private subnet 
```bash
ssh ec2-user@[Your private EC2 private IP]
```
- Show connection of the private EC2 over the Bastion Host

