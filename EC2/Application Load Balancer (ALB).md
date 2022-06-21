# Hands-on EC2-06 : Working with Application Load Balancer (ALB) using a Launch Template

Purpose of this hands-on training is to learn Application Load Balancer (ALB) working process. Especially, we’ll cover the details of the AWS solution suite and walk through how to set up a basic ALB.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- create security group.

- create a target group.

- create Application Load Balancer.

- attach target group to ALB.

## Outline

- Part 1 - Creating a Security Group

- Part 2 - Launch Instances with Launch Template

- Part 3 - Creating a Target Group

- Part 4 - Creating Application Load Balancer together with Target Group

![Apache HTTP Server](./ALB.png)

## Part 1 - Creating a Security Group

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

- Choose Security Groups on the left-hand menu,

- Click the "Create Security Group" tab.

```text
Security Group Name  : ALBSecGroup
Description         : ALB Security Group
VPC                 : Default VPC
Inbound Rules:
    - Type: SSH----> Source: Anywhere
    - Type: HTTP ---> Source: Anywhere
Outbound Rules: Keep it as it is
Tag:
    - Key   : Name
      Value : ALB SEC Group
```

- Click "Create Security Group" button.

