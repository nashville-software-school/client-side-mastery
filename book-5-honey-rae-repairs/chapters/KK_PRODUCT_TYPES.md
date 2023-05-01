# Displaying Product Types on Products

Use the `_expand` query string parameter feature of _json-server_ to expand the product type on the product object when you query the API.


---
**Given** an employee wants to see a list of all products

**When** the employee clicks on the "Product" navigation link

**Then** all product names should be displayed

**And** the product price per unit should be displayed

**And** the name of the product type should be displayed

---

 > In the previous chapter, did you sort the products in your application code? See if you can use the [`_sort`](https://github.com/typicode/json-server#sort) query string parameter feature of _json-server_ to sort the products by name.

