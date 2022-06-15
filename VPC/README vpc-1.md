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

