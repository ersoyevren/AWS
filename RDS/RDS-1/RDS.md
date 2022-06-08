# Hands-on DB-01 : Configuring and Connecting RDS with Console and Workbench

Purpose of the this hands-on training is to configure RDS Instance via AWS Management Console and connect from MySQL Workbench.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- learn how to set configuration of RDS Instance on console.

- learn how to connect to RDS via workbench.

- learn how to manipulate RDS Instance.

## Outline

- Part 1 - Creating RDS Instance on AWS Management Console

- Part 2 - Configuring MySQL Workbench to connect to the RDS Instance

- Part 3 - Manipulating RDS Instance

## Part 1 - Creating RDS Instance on AWS Management Console

- First, go to the Amazon RDS Service and select Database section from the left-hand menu, click databases and then click Creating Database.

- Choose a database creation method.

```text
Standard Create
```

- Engine option

```text
MySQL
```

- Version

```text
8.0.25
```

- Template

```text
Free tier
```

- Settings

```text
DB instance identifier: RDS-mysql
Master username: admin
Master password: Pl123456789
```

- DB instance class

```text
Burstable classes (includes t classes) : db.t2.micro
```

- Storage

```text
Storage type          : ssd
Storage size          : default 20GiB
Storage autoscaling   : unchecked
```

- Connectivity

```text
VPC                           : default

Click Additional Connectivity Configuration;

Subnet group                  : default
*Publicly accessible          : ***Yes
Existing VPC security groups  : Default
Availability Zone             : No preference
Database port                 : 3306
```

- Database authentication

```text
DB Authentication: Password authentication
```

- Additional configuration

```text
Initial DB name                   : clarusway
DB parameter group & option group : default
Automatic backups                 : enable
Backup retention period           : 7 days (Explain how)

Select window for backup to show snapshots
Monitoring  : Unchecked
Log exports : Unchecked

Maintenance
  - Enable auto minor version upgrade: Enabled (Explain what minor and major upgrade are)
  - Maintenance window (be careful not to overlap maintenance and backup windows)

Deletion protection: *Enabled
```

- Estimated monthly costs
Show that when you select `production` instead of `Free Tier Template` it charges you.

- Click `Create Database` button

- Go to database menu and select `RDS-mysql` database and show and explain sub-sections (Connectivity & Security, Monitoring etc.)

- Show the Automatic backup also.

- Show Modify button

- Show action button (restore,take snapshots, etc.)

