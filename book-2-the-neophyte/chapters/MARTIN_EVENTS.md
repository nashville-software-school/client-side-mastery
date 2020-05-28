# Martin Cares

> Checking your email this morning brought an abrupt surprise. An email from Martin.
>
> _"Hi, it's Martin, and I want some more changes made to my aquarium site. Many of my valued customers,"_ you believe you can hear the condescension in the email, but you may be imagining it, _" say that there can be too much information on the page to make sense of it."_
>
> _"What I need to to do is two things."_
>
> _"First, people need to be able to only see Holy Fish, Soldier Fish, or the Common Fish at one time. Give them a way to choose which type, and then only show that type. Feel free to email me back if you have a hard time understanding that."_ That time, you could definitely hear the condescension.
>
> _"Second, my customers should have the ability to show and hide the fish, the tips, and the locations if they want."_
>
> _"If you understood all that, let me know once you have compeleted it so I can take a look."_

## Browser Events

The modern browser emits, or broadcasts, all kinds of events when a user interacts with the web page. In this chapter, you are going to see how to listen and respond to 2 of those events.

1. The "change" events when a user selects something from a dropdown.
1. The "click" event when the user clicks on something with their mouse.

## Fish Type Choice

Add the following code to your HTML page beneath the navigation bar.

> #### `index.html`

```html
<section class="customization">
    <select class="typeChoice">
        <option value="all">Show All Fish</option>
        <option value="holy">Holy Fish</option>
        <option value="soldier">Soldier Fish</option>
        <option value="plebs">Commoners</option>
    </select>

    <button class="toggleTips">Toggle Tips</button>
</section>
```

Then add the following code to your `fishList.js` module.

> #### `scripts/fish/fishList.js`

```js
const fishTypeDropdown = document.querySelector(".typeChoice")

const clearFishList = () => contentTarget.innerHTML = ""

fishTypeDropdown.addEventListener("change", clickEvent => {
    // Get the value of the option chosen by the user
    const userChoice = clickEvent.target.value

    // If the user chose Holy, clear the list and only show holy fish
    if (userChoice === "holy") {
        clearFishList()
        showHolyFish()
    }
})
```

Now you add more `if` conditions in there for each possible choice the user can make to only show the corresponding type. Make sure you clear the fish list in each one so that you don't keep adding to what's currently being displayed.

## Hiding Tips

When the user clicks on the "Toggle Tips" button, you want to hide and show the tip list.

First, add the following CSS class to `main.css`

```css
.hidden {
    display:none;
}
```

Then, listen for the click event on the "Toggle Tips" button in the tip list code. When the user clicks, use the `.classList.toggle()` method to automatically add/remove the `.hidden` CSS class to the tip list HTML component.

> #### `scripts/tips/tipList.js`

```js
const tipVisibilityButton = document.querySelector(".toggleTips")

tipVisibilityButton.addEventListener("click", clickEvent => {
    document.querySelector(".tipList").classList.toggle("hidden")
})
```

Now it is your job to implement the same code for the fish list and the location list.

1. Add two new button on `index.html` next to the one provided. Make sure to give them unique class names.
1. In `fishList.js` and `locationList.js`, add the event listener for the click event on each button to toggle the list visibility.

## Further Practice

If you want to practice handling events some more, to the the [Collecting User Input](./chapters/JS_USER_INPUT_BASICS.md) supplementary chapter and do the exercises there.