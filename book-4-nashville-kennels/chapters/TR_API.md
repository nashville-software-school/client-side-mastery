# Thorns & Roses Data

Before you start building your React application, you need a database to persist the data for it. Please follow these steps to get it set up.

```sh
cd ~/workspace
mkdir thorns-roses-api
cd thorns-roses-api
touch database.json
```

In your JSON file, create the following resources.

* flowers
* nurseries
* distributors
* retailers

## Flower Details

### Properties

1. Color
1. Species

## Nursery Details

### Properties

* Business name

### Info

Nurseries set their own price each flower they sell to a distributor.

## Distributor Details

### Properties

* Business name
* Flower price markup percentage

### Info

Distributors set a standard price markup percentage for each flower they distribute.

For example, Distributor A sets a markup of 10% on flowers. If they purchase a flower from any nursery for $5.00, their price to retailers would be $5.50.

## Retailers

### Properties

* Business name
* Address

### Info

Retailers also set a standard price markup percentage for each flower they sell to consumers.

For example, Retailer A sets a markup of 15% on flowers. If they purchase a flower from any distributor for $3.00, their price to consumers would be $3.45.



## Relationships Reminder

1. Flowers can be grown by multiple nurseries
1. Nurseries can grow many flowers
1. Distributors can purchase from multiple nurseries
1. Nurseries can sell to many distributors
1. Retailers can purchase from one distributor
