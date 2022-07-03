# SQS Hands-on

## Part 1 - Creating Queue, Sending and Receiving Messages

### Step 1 : Create Queue

- Go to `SQS` service on AWS console.

- Click `Create queue`.

- `Details`.
    - Type: Standart (Keep default)
    - Name: My-First-Queue

- Talk about Configuration, Access policy and Dead-letter queue (Keep default)

- Keep rest default.

- Click `Create queue`.

### Step 2 : Send Message

- On My-First-Queue page Click `Send and receive messages`.

- `Send message`.
    - Message body: "This is the first message for sqs."

- Keep rest default.

- Click `Send message`.

- Show `Receive messages` >> `Messages available` = 1.

### Step 3 : Poll for Messages

- Click `Poll for messages` under `Receive messages`.

- Click on the polled message under `Messages`.

- Show the message.

- Click `Done`.

- Select the polled message and click `Delete` and delete the message.


### Step 4 : Populate Queue

- Do the Step 2 again with 3 messages.

- Send 3 new messages consecutively to the queue ("This is the 2nd/3rd/4th message for sqs.")

- Show the messages in the queue.

- Do the Step 3 again and poll the messages.

- Delete the messages in the queue.
