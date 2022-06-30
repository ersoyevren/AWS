
# Hands-on EC2-04 : Extending and Partitioning EBS Volumes

git

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- understand what is the difference between root volume and EBS Volume.

- list volumes to show current status of primary (root) and additional volumes

- demonstrate their knowledge on how to create EBS volume.

- create mounting point on EC2 instances.

- partition volume on EC2 instances.

- resize the volume or partitions on the new EBS volumes.

- understand how to auto-mount EBS volumes and partitions after reboots.

## Outline
- 

- Part 1 - Extend EBS Volume without Partitioning

- Part 2 - Extend EBS Volume with Partitioning

- Part 3 - Extend the Root Volume

- Part 4 - Auto-mount EBS Volumes and Partitions on Reboot

![EBS Volumes](./ebs_backed_instance.png)

# PART 1 - EXTEND EBS VOLUME WITHOUT PARTITIONING

- launch an instance from aws console in "us-east-1a" AZ.
- check volumes which volumes attached to instance. 
- only root volume should be listed
```
lsblk
```
## Section 0 - Create new Volume 

- create a new volume in the same AZ "us-east-1" with the instance from AWS console "5 GB" for this demo.
- attach the new volume from aws console, then list block storages again.
- root volume and secondary volume should be listed
```
lsblk
```
## Section 1 - Mounting Volume

- check if the attached volume is already formatted or not and has data on it.
```
sudo file -s /dev/xvdf
```
- if not formatted, format the new volume
```
sudo mkfs -t ext4 /dev/xvdf
```
- check the format of the volume again after formatting
```
sudo file -s /dev/xvdf
```
- create a mounting point path for new volume (volume-1)
```
sudo mkdir /mnt/mp1
```
- mount the new volume to the mounting point path
```
sudo mount /dev/xvdf /mnt/mp1/
```
- check if the attached volume is mounted to the mounting point path
```
lsblk
```
- show the available space, on the mounting point path
```
df -h
```
- check if there is data on it or not.
```
ls  /mnt/mp1/
```
- if there is no data on it, create a new file to show persistence in later steps

```
cd /mnt/mp1
sudo touch hello.txt
ls
```
## Section 2: Enlarge the new volume (volume-1) in AWS console and modify from terminal

- modify the new volume in aws console, and enlarge capacity from 5GB to 6GB .
- check if the attached volume is showing the new capacity
```
lsblk
```
- show the real capacity used currently at mounting path, old capacity should be shown.
```
df -h
```
- resize the file system on the new volume to cover all available space.
```
sudo resize2fs /dev/xvdf
```
- show the real capacity used currently at mounting path, new capacity should reflect the modified volume size.
```
df -h
```
- show that the data still persists on the newly enlarged volume.
```
ls /mnt/mp1/
```
## Section 3: Rebooting Instance

- show that mounting point path will be gone when instance rebooted 
```
sudo reboot now
```
- show the new volume is still attached, but not mounted
```
lsblk
```
- check if the attached volume is "already formatted" or not and has data on it.
```
sudo file -s /dev/xvdf
```
- mount the new volume to the mounting point path
```
sudo mount /dev/xvdf /mnt/mp1/
```
- show the used and available capacity is same as the disk size.
```
lsblk
df -h
```
- if there is data on it, check if the data still persists.
```
ls  /mnt/mp1/
```

