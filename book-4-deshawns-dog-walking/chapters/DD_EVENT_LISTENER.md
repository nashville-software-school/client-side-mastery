# Event Listener to Show Service Area

## Overview of JavaScript Events

Watch the [Learn JavaScript Event Listeners In 18 Minutes](https://www.youtube.com/watch?v=XF1_MlZ5l6M) video for a wonderful overview of how browser events work. After watching the video read the rest of the chapter, and make sure you read all of the comments in code provided.

There are additional, short videos to watch about specific concepts. Discuss with you peers, or ask an instructor to explain in their own words if the videos don't help.

## Clicking on Walkers

Time for your first event listener. You are going to use your debugger to step through the code to see how it all works.

Add the following code after the import statement in the Walkers module.

> #### `workspace/dog-walking/scripts/Walkers.js`

```js
document.addEventListener(
    "click",  // This is the type of event
    (clickEvent) => {
        /*
            The target of a click event is the most specific HTML element
            that was clicked by the user.
        */
        const itemClicked = clickEvent.target

        /*
            Only run the rest of the logic if a walker <li> was clicked
        */
        if (itemClicked.id.startsWith("walker")) {

            /*
                Extract the primary key from the id attribute of the list
                item that you clicked on. Refer back to the code you
                wrote for each list item. Note the format of the id
                attribute ("walker--2" if you clicked on the second one).

                This code splits that string apart into an array, and
                captures the "2" and assigns it to be the value of the
                `walkerId` variable.

                Splitting a string in JavaScript:
                    https://www.youtube.com/watch?v=u2ZocmM93yU

                Destructuring in JavaScript:
                    https://www.youtube.com/watch?v=UgEaJBz3bjY
            */
            const [,walkerId] = itemClicked.id.split("--")

            /*
                Now that you have the primary key of a walker object,
                find the whole object by iterating the walkers array.
            */
            for (const walker of walkers) {

                /*
                    Compare the primary key of each walker to the one
                    you have. As soon as you find the right one, display
                    the window alert message.
                */
                if (walker.id === parseInt(walkerId)) {
                    window.alert(`${walker.name} services ${walker.city}`)
                }
            }
        }
    }
)
```

Inside the `for..of` loop in the existing code, update the line of code to be the following code.

```js
walkerHTML += `<li id="walker--${walker.id}">${walker.name}</li>`
```

Refresh your browser to load the new code.

Then click on some of the walkers. You should see the name of the city the walker works in appear in an alert box.

![animation of clicking on a walker](./images/first-event-listener.gif)

## Clicking on Pets

Time to repeat the process, but with pets. The process is going to follow the exact same pattern, but the data is different.

Follow this algorithm.

1. Update the code in `RegisteredPets` module so that the `<li>` for each pet has an id attribute with the following format `id="pet--1"`. The primary key should be correct for each element.
1. Add a click event listener to your HTML document.
1. Store the target HTML element of the click event in a variable.
1. Check if the `id` property of the element starts with the string of "pet".
1. If it does, use the `split()` method on the `id` property to get an array of two string (e.g. `["pet", "4"]`)
1. Use array deconstruction to assign the primary key to a variable named `petPrimaryKey`.
1. Find the whole pet object by iterating the array of pet objects and comparing each primary key to the integer value of the `petPrimaryKey` variable.
1. As soon as a match is found, display a message that the dog barks at you  - "Rocket barks at you"
