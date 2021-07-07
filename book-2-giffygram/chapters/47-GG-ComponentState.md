# State of a Component

In this chapter you will explore how a component doesn't just copy application state for its own use, but can also define its own state that no other component has access to.

## Learning Objectives
You should be able to:
* differentiate between application state and component state
* identify where component state is defined in the component module
* explain how state variables are expressed as HTML

## Layers of State

When you first started defining this application, you set up Application State in the store.

1. Users
1. Posts
1. Likes
1. Messages

This is state that affects the entire application functionality. The whole thing revolves around them.

In the **`Footer`** component, there is other state being displayed.

1. A year chosen by the user
1. The number of posts that have been created since that year

![](./images/giffygram-footer-state.png)

It won't be stored in the application state store, but rather as variables in the component module itself _(but not in the component function)_

| | |
|:---:|:---|
| <h1>&#x270e;</h1> |  _The **component module** is the entire file of code. The **component function** is the function in the module that defines the HTML representation of state._ |

## Component State Definition

Above the component function, define two new variables. This is the state that this component will express as HTML. The first is which option is displayed in the select element, and the second is displaying the number of posts since the year chosen.

```js
/*
    COMPONENT STATE VARIABLES
*/
let yearChosenByUser = 2020
let postSinceYearChosen = 0
```

Now you can interpolate that variables into the string template in the compoenent function. This ensures that every time the **`Footer`** component is invoked, the latest state will be represented in the resulting HTML.

```js
/*
    COMPONENT FUNCTION
*/
export const Footer = () => {

    // HTML to be returned to GiffyGram component
    return `
        <footer class="footer">
            <div class="footer__item">
                Posts since <select id="yearSelection">
                    <option ${yearChosenByUser === 2020 ? "selected" : ""}>2020</option>
                    <option ${yearChosenByUser === 2019 ? "selected" : ""}>2019</option>
                    <option ${yearChosenByUser === 2018 ? "selected" : ""}>2018</option>
                    <option ${yearChosenByUser === 2017 ? "selected" : ""}>2017</option>
                </select>
                <span id="postCount">${postSinceYearChosen}</span>
            </div>
        </footer>
    `
}
```
