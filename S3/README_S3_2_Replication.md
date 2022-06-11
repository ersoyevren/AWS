
# Hands-on S3-02 : S3 Lifecycle Management and Bucket Replication

Purpose of the this hands-on training is to review how to to create a S3 bucket, configure S3 to host static website, manage lifecycle of objects and to implement bucket replication.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- create a S3 bucket.

- manage lifecycle of objects in S3.

- deploy static Website on S3.

- manage IAM role for bucket replication.

- set the S3 bucket replica.

## Outline

- Part 1 - Creating Bucket for Lifecycle Management and setting Lifecycle Management

- Part 2 - Creating Source and Destination S3 Bucket

- Part 3 - Creating IAM Role for Bucket Replication

- Part 4 - Configuring (Entire) Bucket Replica

- Part 5 - Configuring (Tags, Prefix) Bucket Replica


## Part 1 - Creating S3 Bucket for Lifecycle Management and setting Lifecycle Management


- Create a new bucket named `pet.clarusway.lifecycle` with following properties.

```text
Allow all public access   : UNCHECKED(PUBLIC) and Acknowledge the warning. 
Versioning                : ENABLE
Tagging                   : 0 Tags
Default encryption        : None
Object lock               : Disabled
```

- Click the S3 bucket `pet.clarusway.lifecycle` and upload following files.

```text
index.html
cat.jpg
```

- Create new folders as "newfolder"

- Open lifecycle display of the log bucket from the management tab and add lifecycle rule with following configuration.
```
MANAGEMENT>>>LIFECYCLE>>>>>ADD LIFECYCLE RULE
```

```text
1. Name and scope
Rule Name : LCRule
Select "Apply to all objects in the bucket"
(Show that you can also select prefix as "newfolder" but skip it for now)
```

```text
2. Transitions
Select current Version
Click Add transition
Object creation:
    transition to "intelligent tiering after" ---> Days after creation "30" days
```

```text
3. Expiration
Click the current version
Show 365+30=395 (determined 30 days in former page)
```

```text
4. Review
Check the box "I acknowledge that this lifecycle rule will apply to all objects in the bucket."
Click save
```


## Part 2 - Creating Source and Destination S3 Bucket

### Step 1 - Create Source Bucket with Static Website

- Open S3 Service from AWS Management Console.

- Create a bucket of `source.replica.clarusway` with following properties,

```text
Region                      : us east-1 (N.Virginia)
Block all public access     : UNCHECKED (PUBLIC)
Versioning                  : ***ENABLE***
Tagging                     : 0 Tags
Default encryption          : Disabled
Object lock                 : Disabled

PS: Please, do not forget to select "US East (N.Virginia)" as Region
```

- Click the S3 bucket `source.replica.clarusway` and upload following files.

```text
index.html
cat.jpg
```

- Click `Properties` >> `Static Website Hosting` and put checkmark to `Use this bucket to host a website` and enter `index.html` as default file.


- Set the static website bucket policy as shown below (`PERMISSIONS` >> `BUCKET POLICY`) and change `bucket-name` with your own bucket.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::DON'T FORGET TO CHANGE ME/*"
        }
    ]
}
```

- Open static website URL in browser and show it is working.

### Step 2 - Create Destination Bucket

- Create a new bucket named `destination.cross.region.replica.clarusway` with following properties.

```text
Region                    : us-east-2 (**Ohio)
Allow all public access   : UNCHECKED (PUBLIC)
Versioning                : ***ENABLED***
Tagging                   : 0 Tags
Default encryption        : Disabled
Object lock               : Disabled


PS: Please, do not forget to select "US East (Ohio)" as Region
```

- Click `Properties` >> `Static Web Hosting` and put checkmark to `Use this bucket to host a website` and enter `index.html` as default file.

- Set the static website bucket policy as shown below (`PERMISSIONS` >> `BUCKET POLICY`) and change `bucket-name` with your own bucket..

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::don't forget to change me/*"
        }
    ]
}
```
## Part 3 - Creating IAM Role for Bucket Replication

- Go to `IAM Service` on AWS management console.

- Click `Policy` on left-hand menu and select `create policy`.

- Select `JSON` option and paste the policy seen below.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:Get*", 
                "s3:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::source.replica.clarusway(change me)",
                "arn:aws:s3:::source.replica.clarusway(change me)/*"
            ]
        },
        {
            "Action": [ 
                "s3:ReplicateObject", 
                "s3:ReplicateDelete",
                "s3:ReplicateTags",
                "s3:GetObjectVersionTagging"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::destination.cross.region.replica.clarusway(change me)/*"
        }
    ]
}
```

- Enter the followings as policy name and description.

```text
Name            : yourname.cross.replication.iam.policy

Description     : yourname.cross.replication.iam.policy
```

- Click `create policy`.

- Go to `Roles` on the left hand menu and click `create role`.

```text
Type of Trusted Entity      : AWS Service
Use Case                    : S3
```

- Click next.

- Enter `yourname.cross.replication.iam.policy` in filter policies box and select the policy

- Click Next `Tag`

```text
Keep it as default
```

- Click Next:Review

- Enter the followings as role name and description an review

```text
Role Name           : yourname.cross.replication.iam.role
Role Description    : yourname.cross.replication.iam.role
```

- Click `create role`.
