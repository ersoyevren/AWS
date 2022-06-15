# Hands-on VPC-01 : Configuring of VPC

Purpose of the this hands-on training is to create VPC and configure VPC with components.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- learn how to create VPC,

- learn how to create subnet,

- learn how to set route tables as public and private,


## Outline

- Part 1 - Creating VPC, Subnet and Subnet associations



## Part 1 - Creating VPC, Subnet and Subnet associations

STEP 1: Create VPC

- First, go to the VPC and select Your VPC section from the left-hand menu, click create VPC.

- `Resources to create` :

```text
VPC only 

Note: After you  create VPC and all other components, show how you can do it easly via the option of "VPC, subnets, etc."
```

- create a vpc named "clarus-vpc-a" with `10.7.0.0/16` CIDR
    - no ipv6 CIDR block
    - tenancy: default

- click create

- explain the vpc descriptions

- enable DNS hostnames for the vpc 'clarus-vpc-a'

  - select 'clarus-vpc-a' on VPC console ----> Actions ----> Edit DNS hostnames
  - Click enable flag
  - Click save 

STEP 2: Create an internet gateway named 'clarus-igw'

- Go to the Internet Gateways from left hand menu

- Create Internet Gateway
   - Name Tag "clarus-igw" 
   - Click create button

-  attach the internet gateway 'clarus-igw' to the vpc 'clarus-vpc-a'
  - Actions ---> attach to VPC
  - Select VPC named "clarus-vpc-a"
  - Push "Attach Internet gateway"

STEP 3 : Configuring Route Table

- Go to the Route Tables from left hand menu

- rename the route table of the vpc 'clarus-vpc-a' as 'clarus-default-rt'

- select Routes on the sub-section

- click edit routes

- click add route

- add a route
    - destination ------> 0.0.0.0/0 (any network, any host)
    - As target;
      - Select Internet Gateway
      - Select 'clarus-igw'
      - save routes

- explain routes in the clarus-default-rt

STEP 4: Create Subnets
- Go to the Subnets from left hand menu
- Push create subnet button

1. 
Name tag          :clarus-az1a-public-subnet
VPC               :clarus-vpc-a
Availability Zone :us-east-1a
IPv4 CIDR block   :10.7.1.0/24

2. 
Name tag          :clarus-az1a-private-subnet
VPC               :clarus-vpc-a
Availability Zone :us-east-1a
IPv4 CIDR block   :10.7.2.0/24

3. 
Name tag          :clarus-az1b-public-subnet
VPC               :clarus-vpc-a
Availability Zone :us-east-1b
IPv4 CIDR block   :10.7.4.0/24

4. 
Name tag          :clarus-az1b-private-subnet
VPC               :clarus-vpc-a
Availability Zone :us-east-1b
IPv4 CIDR block   :10.7.5.0/24

5. 
Name tag          :clarus-az1c-public-subnet
VPC               :clarus-vpc-a
Availability Zone :us-east-1c
IPv4 CIDR block   :10.7.7.0/24

6. 
Name tag          :clarus-az1c-private-subnet
VPC               :clarus-vpc-a
Availability Zone :us-east-1c
IPv4 CIDR block   :10.7.8.0/24

- explain the subnet descriptions and reserved ips (why 251 instead of 256)

