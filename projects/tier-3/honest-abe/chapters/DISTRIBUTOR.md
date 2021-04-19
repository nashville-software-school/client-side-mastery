# Are You Feeling Bouquet? - Distibutors

Each flower shop buys their flowers from a single distributor. Flower distributors serve large regions of the country, and then local retailers purchase from them to keep their stock full

### The Bouquet ERD

Use dbdiagram.io to create an ERD that visualizes the relationship between a **Retailers** and **Distributors** resources. Each of these businesses should have a name, city, state, and address. Just dummy data. Don't worry about creating real addresses.

```html
Table Retailers {
}

Table Distributors {
}
```

### API Resources

Add the new distributor resource to your database and at least 3 distributors. Then refactor your retailers and have each one related to a single distributor.

```json
{
    "retailers": [],
    "distributors": []
}
```

### HTML Representations

Create your data provider for distributors, and then refactor your list of retailers to also display the name of the distibutor business from which each purchases its flowers.

