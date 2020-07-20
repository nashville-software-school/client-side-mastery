# Entity Relationship Diagrams

In this chapter, you will be working with the dbdiagram.io site's diagramming tool, so visit that site and register an account. Then open their diagramming tool.

## Criminals and Notes

In the next couple chapters, you will be learning how to store two objects in your database that are related to each other through what's called a foreign key.

To prepare you for that, you need to create your first visualization of entities and their relationship in dbdiagram.

Copy the following text and paste it into the editor on the left side of the screen. Your instruction team will walk you through what all of the information means in these descriptors.

For now, the foreign key is the `criminalId` attribute on the **`Notes`** entity in the diagram. It is a numeric representation of the entire criminal object that is stored in another collection (_or table in database-speak_).

```html
Table Criminals {
    id int pk
    age int
    eyeColor varchar
    name varchar
    phone varchar
    address varchar
}

Table Notes {
    id int pk
    text varchar
    criminalId int
}

Ref: "Criminal"."id" < "Notes"."criminalId"

```

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