# SNS Hands-on

## Part 1 - Creating Topic, Subscription and Publishing Message

### Step 1 : Create Topic

- Go to `SNS` service on AWS console.

- Click `Topics` >> `Create topic`.

- `Details`.
    - Type: Standart
    - Name: Demo-topic
    - Display Name: My-First-Topic

- Keep rest default.

- Click `Create`.

### Step 2 : Create Subscription

- On Demo-topic page Click `Create subscription`.

- `Details`.
    - Topic ARN: arn:aws:sns:us-east-1:046402772087:Demo-topic (comes default)
    - Protocol: Email
    - Endpoint: test@example.com (your mail here)

- Keep rest default.

- Click `Create subscription`.

- Show `Status` >> `Pending Confirmation`.

### Step 3 : Confirm subscription

- Go to your mail and check inbox.

- Open mail from `My-First-Topic`.

- Click `Confirm subscription`.

- Go back to Demo-topic subscription and refresh the page.

- Show `Status` >> `Confirmed`.

### Step 4 : Publish message

- Select `Topics` from the left-hand menu and click on `Demo-topic`.

- Click `Publish message`.

- `Message details`.
    - Subject: sns-test
    - Time to Live (TTL) : -

- `Message body`.
    - Message structure: Identical payload for all delivery protocols.
    - "This is a test message for sns inclass session".

- Keep rest default.

- Click `Publish message`.

- Go to your mail and check inbox.

- Open mail from `My-First-Topic`.

- Show the topic and the test message sent from SNS.

