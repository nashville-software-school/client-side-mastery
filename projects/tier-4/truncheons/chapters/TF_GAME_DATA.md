# Truncheons &amp; Flagons Game Data

In this chapter you are going to describe the types and structure of data you need to work with to make the game work. Here's the list of resources that your application needs to use.

1. Teams
1. Players
1. Scores

You need to decide what an object representation of a team, a player, and a game score should look like. Again, objects are made of key/value pairs called properties. In software applications, and in databases, each object is assigned a unique numeric identifier. That identifier is usually a property labeled `id` and starts at 1, and gets incremented from there.

## Teams

The information you need to store about a team is its name, and the date it was created. 

## Players

The information you need to store about a player is the first name, last name, country of origin, and the team the player is on.

## Scores

Score are a bit trickier. In Truncheons &amp; Flagons, teams can play multiple games over time. You want to store what each team's score was in each game. Therefore, just adding a `score` property to each team won't cut it. That would simply be their total score over time.

You want a separate collection of scores in the database. Each item in that collection records the team, the team's score, and the date of the game.

## ERD

It should be clear to you by now how critically important the ERD development process is for a successful project. This project may not have that many resources and properties to track, but it is crucial that you have the correct properties and relationships defined, or your project is doomed.

Your team must make one now and ensure that everyone has easy access to it.

Remember that only the data that should be defined in the ERD is what you want to store permanently... long-term. There is a good amount of transient state that is needed in this application. You definitely need to document what it is and plan how/where to store it, but it does not go in the ERD.
