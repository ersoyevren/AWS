
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


