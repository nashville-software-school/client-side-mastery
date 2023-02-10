# Are You Feeling Bouquet?

For this application, there are 4 main resources that interact with each other.

1. Flower retailers
1. Flower distributors
1. Nurseries
1. Flowers

## Nurseries

Nurseries are responsible for growing flowers. A single nursery can grow multiple types of flowers. Any one flower species can be grown by multiple nurseries.

### The Bouquet ERD

Use dbdiagram.io to create an ERD that visualizes the **Flowers**resource.

```html
Table Flowers {
    id int pk
    commonName varchar
    color varchar
}
```

### API Resources

Create a new directory in your workspace for this application. Create an `api` and a `database.json` file in it. In your JSON file, create the resource that reflects your ERD. Here's something to get you started, but it's not complete.

```json
{
    "flowers": []
}
```

Create 5 types of flowers.

### HTML Representations

Create your data provider, your list component and your individual item component. Then display a list of all flowers in your database.