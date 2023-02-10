# Displaying Game Data

## Creating the Application

Go to your terminal and enter in the following commands.

```sh
cd ~/workspace
mkdir truncheons
cd truncheons
mkdir scripts styles api
touch index.html scripts/main.js styles/main.css
```

That sets up the initial directory structure and files for your application. Now `cd` into the `scripts` directory and create the following directories.

* player
* team
* game
* score

## Wireframing and Identifying Components

Your team can either use the existing application as a template, or the team can imagine a completely different layout. What is important is that you draw the user interface and determine the components that need to be made.

For example, teams need to be created. What would be a good name for that component?

    1. Team
    1. TeamList
    1. TeamForm
    1. CreateTeam

You likely have a nascent intuition that some of those names don't make sense, but some do. Your team should write down an appropriate name for each component you identified.


## Rendering the Initial Data

Once your data is defined, your team should define some initial state for the project. Professional developers always start with dummy, or boilerplate, data to mock out a user interface before having to develop the forms needed to create new data.

* Create a array of team names
* Create a array of players. Display the id of the team the player is assigned to.
* Create a array of scores. It should display the number of the team, the score, and the date of the score.

Yes, it's silly to be displaying the number of the team for the player, and the number of the team for the score, but this is just where you start. Then you will use the [find()](https://www.w3schools.com/jsref/jsref_find.asp) method on arrays to join the two objects together so that you can actually display the team name - not the `id`.

Define the algorithm.

Start small.

Start simple.

Make small, incremental changes and merge your branch.

