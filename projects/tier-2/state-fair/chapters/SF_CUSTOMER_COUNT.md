# Challenge: Total Tickets

Create new component that displays above the buttons that will display the total number of tickets that are purchased for the fair. Each time a person purchases **any** ticket, the number of total tickets purchased should be incremented by one.

![animation showing the total ticket count incrementing](./images/ticket-count.gif)

## Component State

So far, your instruction team has talked about how the API has state - the objects and values that are currently stored there.

Your application also has state. Each time you use the `fetch()` function in JavaScript to request data from the API, you are updating the state of your provider components to match the state of the corresponding API resource.

A component in your application can also have its own state. The state of the component can be many things, and those things don't have anything to do with data in the API.

* Component position on the screen
* Whether the component is visible or not
* User input before it is saved to the API

To accomplish this challenge, the component you create will have a variable that is declared in the module. Not inside any functions, but at the module level.

#### Example

```js
// This is a module-level variable. It is not scoped to a function
const contentTarget = document.querySelector(".visitors")

const SampleComponent = () => {
    // This variable is scoped to a function, not the module
    const title = "Look at me"
}
```

Your variable's value will start at 0 because you haven't sold any tickets yet. Then, as soon as any ticket is sold, increment the value of that variable by 1. You have now changed the state of the component.

That means that you need to update the information that you are displaying to your user in the browser. The new state must be expressed as HTML. Wherever you are currently displaying `Total tickets purchased: 0` needs to be updated to `Total tickets purchased: 1`.

You use the state variable in a string template to ensure that the state is always correctly expressed as HTML to your user.

```js
something.innerHTML = `Total tickets purchased: ${yourStateVariable}`
```
