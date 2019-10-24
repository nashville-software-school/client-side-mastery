# HTML Dialogs

> Narrative from Martin about how each fish card is "too busy". Only show image and his nickname, and all other properties are in a "pop up window" when user clicks "more info button".

* Initially show image and name
* Button click shows dialog with species, harvest location, and food

```html
<button class="button--fish" id="ivan-button">Details about Ivan</button>


<dialog class="dialog--fish" id="nemo-details">
    Nemo's Species
    Nemo's location
    Nemo's food
    <button class="button--close" id="close-nemo">Close Dialog</button>
</dialog>

<button class="button--fish" id="nemo-button">Details about Nemo</button>
```

Copy. Paste. Once. Don't touch.

```js
const allDialogs = document.querySelectorAll(".dialog--fish")

document.querySelector(".button--close").addEventListener(
    "click",
    theEvent => {
        for (const dialog of allDialogs) {
            dialog.close()
        }
    }
)
```

Add one of these for every fish that you create. Replace the CSS selector, but nothing else needs to change.

```js
document.querySelector("#ivan-button").addEventListener(
    "click",
    theClickEvent => {
        theDialog = document.querySelector("#ivan-details")
        theDialog.show()
    }
)
```