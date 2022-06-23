# Hands-on CF-01 : Configuring Cloudfront with Route53, ACM and S3 as Static Website

## Part 1 - Creating a Certificate

- Go to Certificate Manager service and hit "Request a certificate"

- Select "Request a public certificate" and hit "Next"

```text

      -  Domain names               : "[your donamin name].net" (naked domain name)

      -  Select validation method   : "DNS validation"
  
      -  Add tags                   : Skip this part
  
      -  Review and click "Request"
```

- On Certificates page Click on your newly created certificate.

- Under Domains pane click "Create record in Route 53" button.

- Click "Create records" on the pop-up menu.

- It takes a while to be ready (Issued).  

## Part 2 - Creating a Static WebSite Hosting

1. Go to S3 service and create a bucket with domain name: "[your-donamin-name].net"

- Public Access Enabled
- Upload Files named "index.html" and "ryu.jpg" in "static-web-v1" folder
- Permissions >>> Bucket Policy >>> Edit >>> Paste bucket Policy - Don't forget to change bucket name in arn.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::BUCKET_NAME_HERE/*"
        }
    ]
}
```

- Properties >>> Static Website Hosting >>> Edit >>> Enable >>> Index document : index.html

## Part 3 - Create CloudFront Distribution

- First of all we need to copy endpoint of S3 static website bucket.

- Go to S3 click on S3 static website bucket >>> Properties >>> Static Website Hosting >>> Copy the endpoint (without http://).

- Go to CloudFront service and click "Create a CloudFront Distribution"

- Create Distribution :
  - Origin:
    - Origin Domain: Paste the "endpoint" (without http://) of the S3 bucket
  - Default Cache Behavior:
    - Viewer Protocol Policy: Select "Redirect HTTP to HTTPS"
  - Settings
    - Alternate Domain Names (CNAME): [your-domain-name]
    - Custom SSL Certificate: Select your newly created certificate

- Leave the other settings as default.

- Click "Create Distribution".

- It may take some time distribution to be deployed. (Check status of distribution to be "Enabled")

- When it is deployed, copy the "Domain name" of the distribution. 

