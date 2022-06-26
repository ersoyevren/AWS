# Hands-on EFS-01 : How to Create EFS & Attach the EFS to the multiple EC2 Linux 2 Instances

## Outline

- Part 1 - Prep(EC2 SecGrp, EFS SecGrp, EC2 Linux 2 Instance)

- Part 2 - Creating EFS

- Part 3 - Attach the EFS to the multiple EC2 Linux 2 instances


## Part 1 - Prep (EC2 SecGrp, EFS SecGrp, EC2 Linux 2 Instance)

### Step 1 - Create EC2 SecGrp:

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

- Choose the Security Groups on left-hand menu

- Click the `Create Security Group`.

```text
Security Group Name  : EC2 SecGrp
Description          : EC2 SecGrp
VPC                  : Default VPC
Inbound Rules:
    - Type: SSH ----> Source: Anywhere
Outbound Rules: Keep it as default
Tag:
    - Key   : Name
      Value : EC2 SecGrp
```

### Step 2 - Create EFS SecGrp:

- Click the `Create Security Group`.

```text
Security Group Name  : EFS SecGrp
Description          : EFS SecGrp
VPC                  : Default VPC
***Inbound Rules:
    - Type: NFS ----> Port: 2049 ------>Source: sg-EC2 SecGrp
Outbound Rules: Keep it as default
Tag:
    - Key   : Name
      Value : EFS SecGrp
```

### Step 3 - Create EC2 :

- Configure First Instance in N.Virginia

```text
AMI             : Amazon Linux 2
Instance Type   : t2.micro
Network         : default
Subnet          : default
Security Group  : EC2 SecGrp
    Sec.Group Name : EC2 SecGrp
Tag             :
    Key         : Name
    Value       : EC2-1
```

- Configure Second Instance in N.Virginia

```text
AMI             : Amazon Linux 2
Instance Type   : t2.micro
Network         : default
Subnet          : default
Security Group  : EC2 SecGrp
    Sec.Group Name : EC2 SecGrp
Tag             :
    Key         : Name
    Value       : EC2-2
```

## Part 2 - Creating EFS

Open the Amazon EFS console at https://console.aws.amazon.com/efs/.

- Click "Create File System" 

```text

Name                            : FirstEFS
Virtual Private Cloud (VPC)     : Default VPC (Keep default)
Availability and Durability     : Regional (Keep default)
```

- To customize settings manually, select the 'Customize' option seen at the bottom 

```text

General

Name                    : FirstEFS (Comes default from previous setting)

Availability and Durability : Regional (Comes default from previous setting)

Automatic backups       : Unchecked "Enable automatic backups"

Lifecycle management    : Select "None"

Performance mode        : General Purpose

Throughput mode         : Bursting

Encryption              : Enable encryption of data at rest

Tags                    : optional
```
Click Next

```text

- Virtual Private Cloud (VPC): Default VPC

- Mount targets: 
  - select all AZ (keep it default)
  - Clear "default sg" from all AZ
  - Add "EFS SecGrp" to all AZ
  

- Show that you can only add one mount point for each AZ though it has multiple subnets(for example custom VPC) 
```
Click next 

```text
File system policy - optional------> keep it as is
```
Click next. Then review and Create 

Show that it is created. 