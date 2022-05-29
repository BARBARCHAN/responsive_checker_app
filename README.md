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
- has_many :company_medias
- has_many :medias, through: :company_medias

## positions table

|column|type|options|
|:--:|:--:|:--:|
|name|string|null:false|
|company|references|foreign_key :true|

- belongs_to :company
- has_many :position_scouts
- has_many :scouts, through: :position_scouts
- has_one :category

## scouts table

|column|type|options|
|:--:|:--:|:--:|
|name|string|null:false|
|subject|string|null:false|
|text|text|null:false|

- belongs_to :user
- has_many :position_scouts
- has_many :positions, through: :position_scouts

## position_scouts　table

|column|type|options|
|:--:|:--:|:--:|
|position|references|foreign_key :true|
|scout|references|foreign_key :true|

- belongs_to :position
- belongs_to :scout

## medias table

|column|type|options|
|:--:|:--:|:--:|
|name|string|null:false|

- has_many :company_medias
- has_many :companies, through: :company_medias
- has_many :position_medias
- has_many :positions, through: :position_medias 

## company_medias table

|column|type|options|
|:--:|:--:|:--:|
|company|references|foreign_key :true|
|media|references|foreign_key :true|

- belongs_to :company
- belongs_to :media

## position_medias table

|column|type|options|
|:--:|:--:|:--:|
|position|references|foreign_key :true|
|media|references|foreign_key :true|

- belongs_to :position
- belongs_to :media

## categories table

|column|type|options|
|:--:|:--:|:--:|
|name|string|null:false|

- has_many :positions