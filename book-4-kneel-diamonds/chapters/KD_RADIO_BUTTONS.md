# Showing Custom Jewelry Options

Time to create all of the component functions for each of the option groups. Just like the **UrbanDweller** function in the Indian Jeans project, you will need to fetch the data from your local API for each of these components since all of the options are in the `database.json` file.

## Learning Objectives

* You should be able to correct use **async** and **await** keywords to request data from an API.
* You should be able to use a `for..of` loop to generate HTML representations of each object in the array.
* You should be able to import the component functions into the main module, invoke them in the correct place, and compose all of the responses into a single HTML string.
* You should be able to update the correct element on the DOM with your generated HTML.


## Render the Metal Options

Create a module to manage the display and selection of a metal by the customer. You can call this module **Metals**, or **MetalOptions** - whatever name makes sense to you. Then create your component function in that module. Don't forget to export the function for use in the main module.

Here's a bit of starter code for you.

##### `scripts/MetalOptions.js`

```js
export const MetalOptions = async () => {
    const response = await fetch("http://localhost:8088/metals")
}
```

Once you complete that, import the function into **main**, invoke it to get the generated HTML and use `innerHTML` to inject the HTML into the DOM. Again, here is some starter code, but it doesn't contain everything you need.

Refer back to the **main** module in Indiana Jeans to remember what else is needed in this module to make it all work. In this starter code, we are providing an overall structure for your HTML that you can use.

```js
import { MetalOptions } from './MetalOptions.js'

const render = () => {
    const metalOptionsHTML = await MetalOptions()

    const composedHTML = `
        <h1>Kneel Diamonds</h1>

        <article class="choices">
            <section class="choices__metals options">
                <h2>Metals</h2>
                ${metalOptionsHTML}
            </section>

            <section class="choices__sizes options">
                <h2>Sizes</h2>
            </section>

            <section class="choices__styles options">
                <h2>Styles</h2>
            </section>
        </article>

        <article class="order">

        </article>

        <article class="customOrders">
            <h2>Custom Jewelry Orders</h2>

        </article>
    `

    container.innerHTML = composedHTML
}
```

## Render Sizes and Styles

Once you show metals, follow the same process to show the options for diamond sizes and jewelry styles.

##### `scripts/StyleOptions.js`

```js
export const StyleOptions = async () => {
    const response = await fetch("http://localhost:8088/styles")

    // Fill in the rest


    return optionsHTML
}
```

##### `scripts/SizeOptions.js`

```js
export const SizeOptions = async () => {
    const response = await fetch("http://localhost:8088/sizes")

    // Fill in the rest


    return optionsHTML
}
```
