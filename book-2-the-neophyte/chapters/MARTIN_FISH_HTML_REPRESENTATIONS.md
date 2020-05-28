# Automate Martin's Website

Now that you have a module whose responsibility is to maintain the state of your application, now you need to convert that raw data into HTML representations and render them in the browser. In this chapter you will automate the creation of the HTML list of fish from the objects in your fish collection, so that you never have to copy/paste the HTML directly when a fish dies, or a fish is added.

## Remove Hard-Coded HTML

Open `index.html` and delete the `<section class="fishList">` element and all of the children fish elements. Refresh the browser and you should now see an empty fish list.

Now you can move on to creating your automated fish making machine.

## Defining the Components

There are two components to this process.

1. **Individual fish**. This will create an HTML representation of each fish to be rendered in the list container.
1. **List of fish**. This will create an HTML container element and have instructions for rendering the individual fish component for each fish in the collection.

Since each of these components have a different responsibility, then each one must be created in its own module.

### Single Fish Component

> **`scripts/fish.js`**

```js
/**
 *  Fish which renders individual fish objects as HTML
 */
const fishHTMLRepresentation = (fishObject) => {
    return `
        <div class="fish">
            <div>
                <img class="fish__image" src="${fishObject.image}" alt="">
            </div>
            <div class="fish__name">${fishObject.name}</div>
            <button id="button--${fishObject.name}">Details</button>

            <dialog class="dialog--fish" id="details--${fishObject.name}">
                <div>Species: ${fishObject.species}</div>
                <div>Location: ${fishObject.location}</div>
                <div>Length: ${fishObject.size}</div>
                <div>Food: ${fishObject.food.join(",")}</div>

                <button class="button--close">Close Dialog</button>
            </dialog>
        </div>
    `
}
```

### Fish List Component

> **`scripts/fishList.js`**

```js
/**
 *  FishList which renders individual fish objects as HTML
 */
const fishList = () => {

    // Get a reference to the `<article class="content">` element
    const contentElement = document.querySelector("insert selector here")

    // Add to the existing HTML in the content element
    contentElement.innerHTML += `
        <section class="fishList">
            All the fish go here!
        </section>
    `
}
```

## Rendering the List in Main Module

> **Reminder:** The `main.js` module should be the last JavaScript file included at the bottom of `index.html`.

Since we want the fish to be immediately rendered when the page loads, then that falls within the responsibility of the `main.js` module. Import the list component into main and invoke the component function.

```js
/*
    This is the only code needed. It starts the task of
    making the list of fish. The function is *defined* in
    fishList.js, but here is where you *invoke* the function
*/
fishList()
```

Refresh your browser again and you should see the following message in the middle of the screen.

![fish container with default message](./images/fish-list-no-for-loop.png)

Hooray!! Your fish list component got rendered to the browser. Next is to render all the fish.

You need the `fish()` component function to do that. That function is in the `fish.js` module, so you need to make sure that the `fish.js` script is included before the `fishList.js` script in your `index.html` file.

Now you can write a `for..of` loop to generate all of the individual fish HTML representations, and keep appending the HTML to a variable. After the loop is done, you have one, long string containing all the HTML.

> **`scripts/fishList.js`**

```js
/**
 *   fishList which renders individual fish objects as HTML
 */
const fishList = () => {

    const contentElement = document.querySelector(".content")

    // Generate all of the HTML for all of the fish
    let fishHTMLRepresentations = ""
    for (const fishObject of fishes) {
        /*
            In this loop, invoke the fish() function
            and pass the current fish object as an argument.
            Each time, add the return value to the
            fishHTMLRepresentations variable with `+=`
        */
    }

    // Add a section, and all of the fish to the DOM
    contentElement.innerHTML += `
        <section class="fishList">
            ${fishHTMLRepresentations}
        </section>
    `
}
```

Now refresh your browser again and all of your fish should be back.

![dynamically rendered fish components](./images/fish-list-with-for-loop.png)

## Ok, So, What Just Happened

You may have understood each step as you did it, or you may not have.

You may have understood how all the pieces connect, or you may not have.

With our years of experience introducing beginners to these abstract concepts, we know that somewhere between 90% to 100% of your entire cohort simply is not capable of understanding the big picture here. You can make sense of each tree, but you can't understand how the forest works as a single ecosystem that is made up of individual trees.

There are several abstract concepts at play here, and your brain's neural network has not been tuned to understand these complex connections yet. That doesn't mean your mind **can't** do it.

It just can't do it **yet**.

## Practice: Argumentative

Understanding how arguments and parameters work with functions - especially when the functions are defined in a different module that where they are used - is something that is hard to understand. In this practice exercise, you are going to explore this concept.

First, in the following line of code in the **`fishList`** module...

```js
fishHTMLRepresentations += fish(fishObject)
```

Remove the fish argument that is being passed to the **`fish`** function.

```js
fishHTMLRepresentations += fish()
```

Refresh your browser. Make sure your developer console is open and you will see the following exception.

![no argument exception](./images/fish-component-no-argument.png)

The exception tells you exactly where it occurred. Line 8 of the `fish.js` module (_**Note:** your line number may be different if you have comments or different amounts of whitespace_). If you open that module and go the the line specified, you will see this.

```js
src="${fish.image}"
```

The key term is `'image' of undefined`. Whenever you see an exception like that, look to the left of the property being accessed. In this case, look to the left of `'image'`. You will see the variable `fish`. That's undefined.

Why is it undefined? It's because you removed the argument that you were passing in when you invoked the function. This component function defines a parameter.

```js
const fish = (fishObject) => {
```

Since you invoked this function without a corresponding argument...

```js
fishHTMLRepresentations += fish()
```

Then the parameter never gets assigned a value to reference. Therefore, it's undefined, and you can't access an `.image` property of something that is undefined.

Now put the argument back in when you invoke the component function and it should all work again.

## Practice: Information Organization

In the following exercises, you are going to building module and components for tips, and locations. You need to separate all of those modules into sub-directories so that you don't end up with dozens of JavaScript files all in one directory. It's confusing.

In the `scripts` directory, create the `fish`, `tips`, and `locations` sub-directories and move all of your current files for automating fish into their `scripts/fish` directory.

This will have the side effect of changing how you import the modules, since their path has changed. You will need to clean up all of your import paths.

## Practice: Automate Martin's Tips

Create a data module, a tip list component, and a tip component to automate the rendering of Martin's fish care tips.

Suggested files to create:

* `scripts/tips/tipData.js`
* `scripts/tips/tipList.js`
* `scripts/tips/tip.js`

## Practice: Automate Martin's Locations

Create a data module, a location list component, and a location component to automate the rendering of Martin's locations for the location page.

Suggested files to create:

* `scripts/locations/locationData.js`
* `scripts/locations/locationList.js`
* `scripts/locations/location.js`
