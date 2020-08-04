# Creating New Players


When the user enters in a new player, capture the click of the _Add Player to Team_ button and have the **`PlayerProvider`** update the API state with a `fetch()` method call, and then update the application state once that is complete.

The **`Leaderboard`** component should react when the application's player state changes and re-render itself with the new state.

## Example UI

![animation showing players added to teams](./images/add-player-to-team.gif)

## Event Flow

![animation of event flow for player state change](./images/add-player-event-flow.gif)