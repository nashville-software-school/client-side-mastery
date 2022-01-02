# Nashville Kennels ERD


![](./images/Kennels_ERD.PNG
)

Optional: Use the below to recreate the ERD at dbdiagram.io.
```
table animals {
  id int [PK]
  name varchar
  breed varchar
  customerId [FK]
  locationId [FK]
}

table locations {
  id int [PK]
  name varchar 
  address varchar 
}

table customers {
  id int [PK]
  name varchar 
  address varchar
}

table employees {
  id int [PK]
  name varchar 
  locationId [FK]
}


Ref: "employees"."locationId" > "locations"."id"

Ref: "locations"."id" < "animals"."locationId"

Ref: "customers"."id" < "animals"."customerId"
```
[Return to Ch. 1: Nashville Kennels Design](./NASHVILLE_KENNELS_DESIGN.md) 

[Return to Book 6 Table of Contents](../README.md) 