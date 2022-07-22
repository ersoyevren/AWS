clear# Hands-on EC2-03 : Creating an Instance with Launch Template and Versioning

Purpose of the this hands-on training is to give the students understanding of how to create Launch Template on AWS Console with `user data` and how to version Launch Templates.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- create and configure Launch Templates.

- modify Launch Template with versioning.

## Outline

- Part 1 - Creating Launch Templates

- Part 2 - Modifying Launch Templates

## Part 1 - Creating Launch Templates

### Step 1: Create Security Group

1. Create a Security Group to be used in Launch Template.


Launch_Temp_Sec_group: SSH 22, HTTP 80 ----> anywhere(0.0.0.0/0)


### STEP 2: Create Launch Template

2. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

3. On the navigation pane, under `INSTANCES`, choose `Launch Templates`.

4. Click on `Create launch template`.

5. Enter a name and provide a description for the initial version of the launch template.


Name                         : MyClaruswayTemplate
Template version description : Origin


6. Autoscaling Guidance


Keep it as default


7. Template Tags


Keep it as is


8. Source Template :


Keep it as is


9. Amazon machine image (AMI)


Amazon Linux 2 AMI (HVM), SSD Volume Type
ami-0022f774911c1d690

10. Instance Type


t2.micro


11. Key pair


Please select your key pair (pem key) that is created before
Example: clarusway.pem


12. Security groups


Security Group Name: Launch_Temp_Sec_group


13. Storage (volumes)


we keep it as is  (Volume 1 (AMI Root) (8 GiB, EBS, General purpose SSD (gp2)))


14. Resource tags


Key             : Name
Value           : Webserver-Origin
Resource type   : Instance


15. Network interfaces


Keep it as is


16. Advance details


Keep it as is


### Step 3: Create an Instance with Launch Template

17. Go to `Launch Template` Menu

18. Select `MyClaruswayTemplate` ---> `Actions` ---> `Launch Instance from Template`

19. Enter number of instance as `1`.

20. Keep the rest of settings as is and click the `Launch instance from template` at the bottom.

21. Go to EC2 Instance menu and show the created instance.

