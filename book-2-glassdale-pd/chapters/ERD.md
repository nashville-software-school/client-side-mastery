# Entity Relationship Diagrams

In this chapter, you will be working with the dbdiagram.io site's diagramming tool, so visit that site and register an account. Then open their diagramming tool.

## Employees

You first task is to create a single visualization of the **Employees** resource that will be in your database. Copy the following text and paste it into the editor on the left side of the screen.

```html
Table Employees {
    id int pk
    firstName varchar
    computerId int
}

Table Computers {
    id int pk
}
```

Then add the following fields:

1. Employee last name
1. Employee age
1. Computer model
1. Computer year of manufacture

---

> **Tips:**
>
> **int** = Integer value  (e.g. 2, 81, 2054)
>
> **double** - Double precision floating point number (e.g. 1.414, 3.14159)
>
> **varchar** = Variable length character value
>
> **pk** = Primary key field