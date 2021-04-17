# Adding Teams and Update Player Form

In this chapter, you will be implementing two `<form>` elements. One to create a team, and one to create a player and assign the player to a team. You will use data providers and custom events so that the player form can immediately re-render when there is a change in the state of the team data.

## Concepts to Implement

* Form "submit" event handlers
* Custom event dispatching and handling
* JavaScript `fetch()` and `.then()` for asynchronous code
* Required fields in forms

## Sample User Interface
![animation for adding a team](./images/add-team.gif)

## Event Flow

![](./images/add-team-event-flow.gif)