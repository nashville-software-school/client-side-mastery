# Completing the Performance

When Mike or Leslie have completed a performance, they would like to choose their name from a `<select>` element and have it recorded permanently. The date of completion should also be recorded when a name is chosen.

## Display Clowns

Display a select element next to each performance so that Buttons or Lollipop can be selected as the performer.

Recall that the value of each option in the select element has the primary key of the reservation AND the primary key of the clown delimited with 2 dashes. Starter code is provided, but you have to replace the `xxx` text with the appropriate variables.

```js
<select class="clowns" id="clowns">
    <option value="">Choose</option>
    ${
        clowns.map(
            clown => {
                return `<option value="${xxx.id}--${xxx.id}">${xxx.name}</option>`
            }
        ).join("")
    }
</select>`
```

## Creating New State for Completion

Add the following event listener to your requests module. It should create a new state object, and then send that state to a function in your data access module which will POST it to the API.

```js
mainContainer.addEventListener(
    "change",
    (event) => {

    }
)
```
