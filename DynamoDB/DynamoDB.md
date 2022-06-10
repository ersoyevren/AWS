## Part 1 - Creating DynamoDB Tables

### Step 1 : Create Product Catalog Table

- Go to `DynamoDB` service on AWS console.

- Click `Create Table`. 

- Set table name as `ProductCatalog`.

- Set Partition Key as `Id` and select the type of key as `Number`. No Sort Key.

- Leave other settings default.

- Click `Create`.

### Step 2 : Create Forum Table

- Click `Create Table`.

- Set table name as `Forum`.

- Set Partition Key as `Name` and select the type of key as `String`. No Sort Key.

- Leave other settings default.

- Click `Create`.

### Step 3 : Create Thread Table

- Click `Create Table`.

- Set table name as `Thread`.

- Set Partition Key as `ForumName` and select the type of primary key as `String`.

- Set Sort Key as `Subject` and select the type of sort key as `String`.

- Leave other settings default.

- Click `Create`.

### Step 4 : Create Reply Table

- Click `Create Table`.

- Set table name as `Reply`.

- Set Partition Key as `Id` and select the type of primary key as `String`.

- Set sort key as `ReplyDateTime` and select the type of sort key as `String`.

- Select `Customize settings` under `Settings` pane.

- Click `Create global index` under `Secondary Indexes`.

  - Set Partition Key as `PostedBy` and select the type of primary key as `String`.

  - Set sort key as `Message` and select the type of sort key as `String`.

  - Leave the index name as `PostedBy-Message-Index` which is automatically created.

  - Leave the projected attributes as `All`.

  - Click `Create index`.

- Keep all the rest of settings as default.

- Click `Create`.

