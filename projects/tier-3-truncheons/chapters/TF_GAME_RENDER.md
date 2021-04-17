# Displaying Game Data

In this chapter, you are going to render the data to the browser DOM. You are going to start simple. Each collection of data will be converted into HTML, and just listed with the `<ul>` element.

## Creating the Application

Go to your terminal and enter in the following commands.

```sh
cd ~/workspace
mkdir truncheons
cd truncheons
mkdir scripts styles
touch index.html scripts/main.js styles/main.css
```

That sets up the initial directory structure and files for your application. Now `cd` into the `scripts` directory and create the following directories.

* player
* team
* game
* score

## Initial Component Files

1. Create your provider components in the appropriate directories.
    * **`TeamProvider`**
    * **`PlayerProvider`**
    * **`ScoreProvider`**
1. Create your list components in the appropriate directories
    * **`TeamList`**
    * **`PlayerList`**
    * **`ScoreList`**
1. Create your individual item components.
    * **`Team`**
    * **`Player`**
    * **`Score`**

## Rendering the Data

Now it's time to use all of these components to render the data to the DOM. Reference the code you have from Chapter 12 of Martin's Aqaurium to add all of your data to the providers, and then use the list and item components to render it all.

* Create a list of team names
* Create a list of players. Display the id of the team the player is assigned to.
* Create a list of scores. It should display the number of the team, the score, and the date of the score.

Yes, it's silly to be displaying the number of the team for the player, and the number of the team for the score, but this is just where you start. In the next few chapters, you will learn how to use the [find()](https://www.w3schools.com/jsref/jsref_find.asp) method on arrays to join the two objects together so that you can actually display the team name - not the `id`.