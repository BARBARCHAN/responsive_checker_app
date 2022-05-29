# Database Design

## admins table

|column|type|options|
|:--:|:--:|:--:|
|name|string|null:false|
|email|string|null:false|
|encrypted_password|string|null:false|


## users table

|column|type|options|
|:--:|:--:|:--:|
|name|string|null:false|
|email|string|null:false|
|encrypted_password|string|null:false|

- has_many :companies
- has_many :scouts

## companies table

|column|type|options|
|:--:|:--:|:--:|
|name|string|null:false|

- belongs_to :user
- has_many :positions

