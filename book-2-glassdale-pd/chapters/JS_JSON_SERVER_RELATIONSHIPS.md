# Using `_expand` and `_embed` #

With JSON Server, you can use parameters such as `_expand` and `_embed` to see relationships. However, to utlize the `_expand` and `_embed` functionality within your fetch requests, you need to abide by certain naming conventions in order for the requests to work properly.

* Each resource in your `database.json` needs to be in the plural form.

* When using foreign keys, the property name should be the singular of the resource being reference followed by `Id`.

Say you run a Puppy Adoption agency. Your database would probably include information about the `puppies`, `owners`, and the `adoptions`, and look something like this:
```
{
    "puppies": [
        {
            "id": 1,
            "name": "Ada Grace",
            "breed": "Terrier Mix"
        }, ...
    ],
    "owners": [
        {
            "id": 1,
            "name": "Margaret",
            "phone": "827-293-2938"
        }, ...
    ],
    "adoptions": [
        {
            "id": 1,
            "date": "1996-06-07",
            "ownerId": 2,
            "puppyId": 3
        }, ...
    ]
}
```
Notice the foreign keys in adoptions are `ownerId` and `puppyId` (the singlar of the resource that is being referenced)

In a parent/child relationship, the child resource has the foreign key property on it that references a parent. In this example, `puppies` & `owners` are parent resources and `adoptions` is a child resource.

----
## _expand ##
 
`_expand` is used on a child resource as a way to include parent resources.

When writing your fetch request, you will reference the resource(s) you want to `_expand` in the singular form like this `http://localhost:8088/adoptions?_expand=puppy&_expand=owner`

This is an example of the data you will get back:
```
  {
    "id": 1,
    "date": "1996-06-07",
    "ownerId": 2,
    "puppyId": 3,
    "puppy": {
      "id": 3,
      "name": "Sally",
      "breed": "Lab Mix"
    },
    "owner": {
      "id": 2,
      "name": "Margaret",
      "phone": "192-178-2940"
    }
  }
```

---
## _embed ##

`_embed` is used on a parent resource as a way to include children resources.

When writing your fetch request, you will reference the resource(s) you want to `_embed` in the plural form like this `http://localhost:8088/owners?_embed=adoptions`

```
  {
    "id": 2,
    "name": "Margaret",
    "phone": "192-178-2940",
    "adoptions": [
      {
        "id": 1,
        "date": "1996-06-07",
        "ownerId": 2,
        "puppyId": 3
      },
      {
        "id": 3,
        "date": "2016-04-15",
        "ownerId": 2,
        "puppyId": 2
      }
    ]
  }
  ```