# Multiple Walkers in a City

Add this object to your array of walkers in your database.

```js
{
    id: 14,
    name: "Amelia Anderson",
    email: "amelia@andersonfam.com",
    city: "San Diego"
}
```

Amelia works in San Diego, but so does Hunfredo.

Now refresh your DeShawn's project in the browser and you'll see that "San Diego" now shows up twice in the list of cities. While this may not seem catastrophic, it certainly is confusing for the user.

Having duplicate state, especially without additional context, show up in your user interface is never a good thing. It breaks the pattern that is intended for the application, which makes customers unhappy.

## Foreign Keys

Your task for this Explorer Chapter is to think about, discuss, and design a plan for how to ensure that each city only shows up once in the city list. Over time, there may be dozens of walkers working in a single city as DeShawn's business grows.

Consider making the `city` property on a walker a foreign key instead of a string value. Design an algorithm before you make any code changes.

Remember that your job is to solve the problem, and then write the code for the solution. Never try to solve a problem with code.

* What impact would this have in the database module?
* How would the algorithm for the walker click event be affected?
* Are there any new dependencies needed for the project?

## Help If Needed

You are **strongly encouraged** to build your own algorithm and understand what needs to be changed before looking at a hint.

<details>
    <summary>Hint for data change</summary>

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

</details>
