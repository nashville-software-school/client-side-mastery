# Are You Feeling Bouquet? - Nurseries

Nurseries are responsible for growing flowers. A single nursery can grow multiple types of flowers. Any one flower species can be grown by multiple nurseries.

### The Bouquet ERD

In your ERD create a resource for **Nurseries** and any other tables needed to visualize the relationship between **Nurseries** and **Flowers**.

```html
Table Nurseries {
    id int pk
}
```

Once you are done with that, the next step is to define the relationship between distributors and nurseries.

* A distributor can purchase flowers from multiple nurseries
* A nursery can sell flowers to multiple distributors

Update your ERD to visualize that relationship between **Nurseries** and **Distributors**.

### API Resources

1. Add the new nurseries resource to your database and define at least 5 nurseries.
1. Have each nursery grow at least two kinds of flowers in the intersection table.
1. Have each of your distributors purchase flowers from two different nurseries.

```json
{
    "nurseries": []
}
```

### HTML Representations

Create your data provider for nurseries. Then refactor your list of retailers so that each one displays the following information.

1. Distributor purchased from.
1. Source nurseries that the distributor purchased from.
1. List of flowers it can sell based on the distributor and nursery.