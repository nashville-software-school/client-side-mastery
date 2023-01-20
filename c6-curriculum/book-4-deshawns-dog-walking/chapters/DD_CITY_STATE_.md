# New City State

Your walker data structure currently has `city` as a key on each object with a value of a string. That's fine for such a small scale of dog walking employees. Over a span of years, though, DeShawn significantly expands the number of people in each city that walk dogs.

This means that the string value of, say, "Chicago" is repeated many times on the walker objects. Unfortunately, this quickly leads to data inconsistencies as the person creating the objects mistakenly types in "Chigago" for one person, and "Cihcago" for another.

This happens far too often when humans are asked to manually enter in the same data into a database over and over again. We're awesome at making mistakes.

What would alleviate this problem is having the string of "Chicago" only entered once in the entire database, and the each walker would reference that string.

This means that the walker data struture should no longer have a `city` key, but rather a `cityId` key. The value would now be an integer foreign key to an object in a new collection called `cities`.

```js
const database = {
    cities: [
        {
            id: 1,
            name: "Chicago"
        }, ...
    ],
    walkers: [
        {
            id: 1,
            name: "Alphonse Meron",
            email: "ameron0@mashable.com",
            cityId: 1
        }, ...
```

Your task is to move all of the current city names into a `cities` collection in your database, and have each walker object reference the correct one via a foreign key.

This will also mean changing, a.k.a. refactoring, your existing code for the city list, and for the event listener on the walker list that shows an alert for that walker's city.


