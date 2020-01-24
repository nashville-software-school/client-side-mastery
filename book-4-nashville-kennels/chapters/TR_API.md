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

## Relationships Reminder

1. Flowers can be grown by multiple nurseries
1. Nurseries can grow many flowers
1. Distributors can purchase from multiple nurseries
1. Nurseries can sell to many distributors
1. Retailers can purchase from one distributor
