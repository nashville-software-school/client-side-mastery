# Showing Posts by Author

In this chapter, you are going to implement another select element in the footer component. Unlike the post count feature - which only dealt with component state - this one will be working with application state because it will change the way the list of posts are rendered.

## Displaying Users as Options

Import `getUsers` from data store and build an option element for each person.

## New Application State for PostList

Currently, the post list component shows all posts. Since the user will have the ability to specify a subset of posts she wants to see, the post list will have to be dependent on a new state variable.

## Listening for Selected User

Another `change` event listeners in the **`Footer`** component.

## Setting Application State

New function in the data store that sets the value of application state variable used by **`PostList`** to render _(display)_ posts.

When any state changes, all of the application's HTML must be regenerated. Time to first the `stateChanged` custom event again.

## Video Review

Insert video walkthrough here.