# Truncheons &amp; Flagons Game Data

In this chapter you are going to describe the types and structure of data you need to work with to make the game work. Here's the list of resources that your application needs to use.

1. Teams
1. Players
1. Scores

You need to decide what an object representation of a team, a player, and a game score should look like. Again, objects are made of key/value pairs called properties. In software applications, and in databases, each object is assigned a unique numeric identifier. That identifier is usually a property labeled `id` and starts at 1, and gets incremented from there.

```js
/*
    Object representation of dogs. They are contained in an
    array since it is a collection of resources.
*/
const dogs = [
    {
        id: 1,
        name: "Whiz",
        breed: "Terrier",
        age: 3
    },
    {
        id: 2,
        name: "Angus",
        breed: "Australian Shepherd",
        age: 5
    }
]
```

You could also store a collection of toys that each dog plays with. Your first instinct, since it's a collection about each dog, would be to put an array on each dog.

```js
{
    id: 2,
    name: "Angus",
    breed: "Australian Shepherd",
    age: 5,
    toys: ["Squeaky ball", "Stuffed cat"]
}
```

While this is a valid way to store data, modern software applications use databases that are flat. What does flat mean, you might ask? Well, since toys are a collection of resources you need in your application, they would be store in their own, separate collection. Each toy would then have a property that identifies which animal it belongs to.

So if Angus has two toys that he plays with, here is how the data will look. Remember that Angus' unique identifier in the database is the number 2.

```js
/*
    Object representations of toys. They are contained in an
    array since it is a collection of resources. These objects
    also store a relationship to an object in another collection.
*/
const toys = [
    {
        id: 1,
        type: "Squeaky ball",
        dogId: 2
    },
    {
        id: 2,
        type: "Stuffed cat",
        dogId: 2
    }
]
```

## Teams

The information you need to store about a team is its name, and the date it was created. What would a collection of teams look like in JavaScript?

## Players

The information you need to store about a player is the first name, last name, country of origin, and the team the player is on. What would a collection of players look like in JavaScript?

## Scores

Score are a bit trickier. In Truncheons &amp; Flagons, teams can play multiple games over time. You want to store what each team's score was in each game. Therefore, just adding a `score` property to each team won't cut it. That would simply be their total score over time.

You want a separate collection of scores in the database. Each item in that collection records the team, the team's score, and the date of the game.  What would a collection of scores look like in JavaScript?

## Checking In

Think about these data structures, talk with your teammates, and once you feel you have a good structure for all the data, visit one of your instructors and review it. Getting the data for your application is **the most critical** part of building the application out, so you need to make sure it is correct.
