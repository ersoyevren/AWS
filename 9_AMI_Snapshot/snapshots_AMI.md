# Hands-on EC2-05 : Working with EC2 Snapshots

Purpose of the this hands-on training is to teach students how to take a snapshot of EC2 instance, create an image from EC2 instance and using Data Lifecycle Manager. 

## Learning Outcomes

- At the end of the this hands-on training, students will be able to;

- take snapshots of EC2 instances on AWS console.

- create images from EC2 instances on AWS console.

- understand of difference between the image and the snapshot.

- create different types of AMI.

- using the Data Lifecycle Manager 

- coping and sharing AMI

## Outline

Part 1 - Creating an Image from the Snapshot of the Nginx Server and Launching a new Instance

Part 2 - Creating an Image and Launching an Instance from the same Image

Part 3 - Creating an Image from the Snapshot of the Root Volume and Launching a new Instance

Part 4 - Make AMI Public

Part 5 - Create Wordpress with AMI (Bitnami)

Part 6 - Using Data Lifecycle Manager 

## Part 1 - Creating an Image from the Snapshot of the Nginx Server and Launching a new Instance

- Launch an instance with following configurations.

  a. Security Group: Allow SSH and HTTP ports from anywhere with named "SSH and HTTP"

  b. User data (paste user data seen below for Nginx)

  ```text
  #!/bin/bash

  yum update -y
  amazon-linux-extras install nginx1.12
  yum install wget -y
  cd /usr/share/nginx/html
  chmod o+w /usr/share/nginx/html
  rm index.html
  wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/index.html
  wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/ken.jpg
  systemctl start nginx
  systemctl enable nginx
  ```

  c. Tag: Since "Data Lifecycle Manager" work based on tags, we use tag to customize Instance!!!!!!!! 

  ```text
  Key: Name 
  Value: SampleInstance  
  ```
- First copy the Instance ID and then go to EC2 dashboard and click "Snapshot" section from left-hand menu.


- Click `create snapshot` button.

Select resource type : Instance
Instance ID          : Select the instance ID of Nginx
Name(manually)       : Instance-Snapshot_First

- Click create snapshot.

- Click snapshot `Action` menu and select `create image`

```text
Name        : ClaruswayAMI_1
Description : ClaruswayAMI_1
```

- Click the `launch instance` tab.

- Click `myAMI` from left-hand menu.

- Select `ClaruswayAMI_1' AS AMI

- Launch instance named "Instance_1_from_Sample_Instance"

- Copy the public IP of the newly created instance and paste it to the browser.

- Show that the Nginx Web Server is working.

## Part 2 - Creating an Image and Launching an Instance from the same Image with "Action Menu"

- Go to `SampleInstance`

- Click the actions menu.

- Select image >> create image.

```text
Name        : ClaruswayAMI_2
Description : ClaruswayAMI_2
```

- Click AMI section from left hand menu and show `ClaruswayAMI_2`

- After ClaruswayAMI creation process is completed, click snapshot section from left-hand menu.

-  Show that AWS has created a new snapshot for newly created `ClaruswayAMI_2` image.

-  Click the `launch instance` tab.

- Click `myAMI` from left-hand menu.

- Select `ClaruswayAMI_2`.


- Launch instance as named "Instance_2_from_Sample_Instance_"

- Copy the public IP of the newly created instance and paste it to the browser.

- Show that the Nginx Web Server is working.

- Check the "Snapshot Menu" ıf there is an extra snapshot or not. If yes, then  name it. Explain the reason.

```text
Name : Snapshot_Second_Auto 
```
## Part 3 - Creating an Image from the Snapshot of the Root Volume and Launching a new Instance

- Go to EC2 menu and click snapshot section from left-hand menu.

- Click `create snapshot` button.
```text
Select resource type : ****Volume
Instance ID : select the root volume of the SampleInstance
Name(manually)       : Snapshot_Third 
```

- Go to the AMI menu and Click create AMI.

```text
Name        : ClaruswayAMI_3
Description : ClaruswayAMI_3
```
- Click the `launch instance` tab.

- Click `myAMI` from left-hand menu.

- Select `ClaruswayAMI_3`.

- Launch instance as named "Instance_3_from_Sample_Instance_"

- Copy the public IP of the newly created instance and paste it to the browser.

- Show that the Nginx Web Server is working.

