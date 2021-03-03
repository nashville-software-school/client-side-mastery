# Truncheons &amp; Flagons

> **Instructor Note:** This application is complex, but once complete, provides people with a strong foundation in how modern component-based applications work. It is **strongly encouraged** that you work on this application with your teammates and not alone.

## The Making of the Most Popular Tavern Game of the Middle Ages

![](./images/tattered-flagon.jpeg)

In the roaring 1130's, peasants and serfs across Europe and Western Asia popularized a tavern game known as Truncheon & Flagons. Scholars believe that the game originated in the Tattered Flagon tavern located in Southern Aragon, near the city of Jara.

Since it was not an official game of the royalty or merchant classes at the time, writings about it are rare and often vague. However, what modern anthropologists have been able to piece together paint a picture of an odd, fun, and sometimes violent game - depending on how drunk the contestants became.

The rules of the game were fairly simple, yet allowed for some subtlety.

1. There are three teams in a game of Truncheon & Flagons.
    * The Knights
    * The Fairies
    * The Goblins
1. Each team has three players.
1. Six flagons of ale, mead, or wine are be arranged on a table. Four flagons making the corners of a square, and the fifth and sixth being placed in the middle of the square. The table should be in an area of a tavern where the teams had some ability to move around.
1. Teams rotated between being the Knights, Fairies, and Goblins after each round.
1. The Knights have to throw a small wooden ball into one of the flagons. Each Knight has their own ball.
1. Each Knight that successfully throws a ball into a flagon earns 2 points for the Knights.
1. Each Knight that successfully throws a ball that lands on the table earns 1 point for the Knights.
1. The Goblins guard the flagons by swinging small truncheons to knock the ball out of the air before it landed in a flagon or on the table.
1. Each Goblin that successfully knocks a thrown wooden ball out of the air earns 1 point for the Goblins.
1. The Fairies can distract the Knights or the Goblins.
1. If a Fairy distract a Knight enough that a ball is dropped, or thrown out of the playing area, the Fairies receive 1 point.
1. If a Fairy distracts a Goblin enough so that a thrown ball lands anywhere in the playing area _(on the table or in a flagon)_ without any defensive truncheon swings, the Fairies receive 1 point.
1. There are three rounds so that each team can play each role.
1. At the end of round three, whichever team has the most points earns the honor of drinking the contents of the six flagons.

![](./images/bludgeon.jpg)



## Learning Objectives

The learning objectives of this project, by the end of the client side course, are the following.

* Identifying and building components
* Using `fetch` to store and retrieve data from a persistent data store.
* Handling browser-generated and custom events
* Understanding asynchronous programming
* Collecting user input and acting on it
* Modular CSS
* Modular JavaScript

## Application Features

1. You need to have a form where you can enter in a team name. For example, _The Green Wyverns_ or _French Flagons_.
1. You need to have a form where you can enter in a contestant name and assign the player to a team.
1. You need to display the scores of each team in a current game of Bludgeons & Flagons.
    | Team | Current Points |
    |--|--|
    | Green Wyverns | 5 |
    | French Flagons | 6 |
    | Black Knights | 3 |
1. You need a component that shows the cumulative of all points for each team for all games that they have played.
    | Team | Current Points |
    |--|--|
    | Green Wyverns | 51 |
    | French Flagons | 35 |
    | Black Knights | 42 |
1. You need a component that is the main game scoring area. Requirements for this component are below.
1. No more than three players can be added to a team.

## Game Play

* When the application first renders, there should be a button labeled _"Start Game"_ in the game scoring area.
* When the user clicks on the _"Start Game"_ button, the user should be presented with three dropdowns. Each dropdown should only list teams with three players.
* When the user has selected three _**distinct**_ teams to play a game of Truncheons & Flagons, the user should be presented with a view to enter in the scores. It should have three input fields. The label for each field should be the name of a team. At the bottom on the form, there must be a button labeled "Save Round Score".
* The user must be able to enter in the scores for all three rounds. When the user enters in scores for all three teams for round one and clicks the "Save Round Score" button, the form should be presented again to enter in the scores for round two.
* Each time a round is complete, the current total score for each team should be displayed.
* Once the scores have been entered for all three rounds, the _"Start Game"_ button should appear again and the leaderboard should have the scores for each team updated with their scores for this game added to their cumulative score.

## Component Design

Given those feature requests, what you need to do in this chapter is the following tasks.

1. Identify the components that need to be rendered in this application.
1. Identify the structure and relationship of the components _(e.g. a **`TeamForm`** component is rendered as a child of the **`Game`** component, etc...)_
1. Decide on a layout for your Truncheon &amp; Flagons application. Draw a simple wireframe that shows where each component will be rendered.
1. Come see a member of the instruction team to review your component layout.
1. After discussing your layout, you can then create a new project directory of `~/workspace/flagons`, and start building the HTML and CSS of your components and layout.

> **Reminder:** Remember to create a CSS file for each component, and use the `@import` statement in `main.css` to include each one. Also consider what sub-directories you will need under the `scripts` directory, if any. Discuss with your instructor.