# Checkers using jQuery

## Setup
These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/javascript/checkers && cd $_
```

1. Use `npm` to install jQuery, Browserify, and any other packages you need to compile your modules.

## Instructions
Create a checkers game using only jQuery to manipulate the DOM. Augment your javascript files using Browserify. You should have a minimum of three javascript files that handle aspects of the game. Create at least two object constructors, one named Game and one named Player that will utilize methods and properties from your augmented files.

## Requirements

1. Create a grid of sixty-four boxes
1. Alternate colors of the boxes
1. Initialize the board with 12 pieces on either side
1. Only one side may move at a time
1. To move a piece you can drag and drop
1. Moves must comply with the following rules:
    1. Pieces may only move diagonally towards opponent
    1. Pieces may move only one square (unless capturing)
    1. When a piece is jumped it is removed from the board
    1. Allow for multiple jumps
    1. If piece is in a position to capture it must make the move (if more than one capture is available the player may choose)
    1. When a piece reaches the furthest row from the player it becomes a king
    1. Kings may move forward and backwards
    1. Kings may combine captures forward and backwards
    1. A player wins when their opponent can no longer make a move
1. When a win happens:
    1. Alert the players who won
    1. Disallow any further clicks on the game board
    1. Display a `play again` button that resets the game

*Bonus* Save game stats and output them when a player wins.

# Automated Unit Tests

For the truly brave.

Develop a process that lets you automate the running of your unit tests with a Grunt task. You could start by looking at the [grunt--contrib-jasmine](https://www.npmjs.com/package/grunt-contrib-jasmine) npm package. You'll need Browserify and a few other tools in order to get it working. It will require a lot of Googling and reading articles because it is **not** a straightforward, or easy, task.  

This article may prove helpful:
[Testing a Browserify Project With Jasmine and Grunt](http://dapperdeveloper.com/2015/01/21/testing-a-browserify-project-with-jasmine-and-grunt/)

# Gaming with Prototypal Inheritance

Build a console-based game where two opponents can battle each other to the death. You pick the warring factions:

1. Little Ponies vs. Orcs
1. Transformers vs. Garden Gnomes
1. Farmers vs. Lobbyists
1. Instructors vs. Students

etc..

Your job is to use JavaScript's prototypal inheritance to build general objects that define the universal capabilities and properties of each warring faction. Then define more specific objects that utilize the general objects - using OLOO - to build the possible players in the game for each faction.

For example, if one of the warring factions is My Little Ponies, then Twilight Sparkle may have different endurance or fighting abilities than Applejack.

# Web Components

Using [Polymer](https://elements.polymer-project.org/), have each team member construct a web component that will be composed into a single page application that uses local storage.

Here's some example ideas.

1. A clock, a calendar, and a contact list for keeping track of time and appointments with people.
1. A material and project tracker for a hobbyist. Materials get included in projects, and when a project is complete, the count of each material must be updated.
1. A wilderness preparedness application. Current weather conditions, gear packing list, mapping component to see terrain, and hazard alerts.