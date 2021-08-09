# Showing Posts by Author

In this chapter, you are going to implement another select element in the footer component. Unlike the post count feature - which only dealt with component state - this one will be working with application state because it will change the way the list of posts are rendered.

## Displaying Users as Options

| | |
|:---:|:---|
| <h1>&#x270e;</h1> |  _The `map()` array method is a conversion tool. It is used to convert everything in an array into something else and put it in another array._ |


Import `getUsers()` and pull application state into component state.

```js
/*
    COMPONENT STATE VARIABLES
*/
const users = getUsers()
let yearChosenByUser = 2020
let postSinceYearChosen = postsSince(yearChosenByUser)
```

Then build an option element for each person with the `map()` array method. Add the following HTML into the string template for the footer component.

```html
<div class="footer__item">
    Posts by user <select id="userSelection">
        ${users.map(user => `
            <option id="user--${user.id}">${user.id}</option>
        `)}
    </select>
</div>
```

## New Application State for Chosen User

Currently, the post list component shows all posts. Since the user will have the ability to specify a subset of posts she wants to see, the post list will have to be dependent on a new state variable.

```js
feed: {
    chosenUser: null
}
```

## Listening for Selected User

Another `change` event listeners in the **`Footer`** component.

## Setting Application State

New function in the data store that sets the value of application state variable that is storing the user chosen in the **`Footer`** component.

```js
export const setChosenUser = (userId) => {
    applicationState.feed.chosenUser = userId
}
```

When any state changes, all of the application's HTML must be regenerated. Time to fire the `stateChanged` custom event again.

```js
applicationElement.addEventListener("change", changeEvent => {
    if (changeEvent.target.id === "userSelection") {
        setChosenUser(parseInt(changeEvent.target.value))
        applicationElement.dispatchEvent(new CustomEvent("stateChanged"))
    }
})
```