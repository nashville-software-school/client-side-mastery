#!/bin/bash
set -u

mkdir -p "$HOME/workspace/kneel-diamonds/scripts"
mkdir -p "$HOME/workspace/kneel-diamonds/styles"
cd "$HOME/workspace/kneel-diamonds"

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Kneel Diamonds</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main id="container">

        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' > index.html

echo '@import "details.css";
@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
	color: #404040;
	font-family: "Comfortaa", Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5;
}

h1,h2,h3,h4,h5,h6 {
  font-family: "Patua One", serif;
  letter-spacing: 2px;
}

ul {
    list-style-type: none;
    padding-inline-start: 0.25rem;
}

#orderButton {
    margin: 1rem 0 2rem 2rem;
    padding: 0.5rem;
    background-color: rgb(227, 72, 72);
    color: lightgoldenrodyellow;
    font-size: 1rem;
}
' > ./styles/main.css

echo '/* You need to create the rest of styles for the layout shown */

.options {
    flex-basis: 24%;
    margin: 0 2rem;
    border: 1px dashed dodgerblue;
    padding: 1rem;
    border-radius: 0.5rem;
    box-shadow: 0.25rem 0.25rem 0.5rem rgb(143, 143, 143);
}
' > ./styles/details.css

echo 'import { KneelDiamonds } from "./KneelDiamonds.js"

const mainContainer = document.querySelector("#container")

const renderAllHTML = () => {
    mainContainer.innerHTML = KneelDiamonds()
}

renderAllHTML()
' > ./scripts/main.js

echo '/*

    This module contains all of the data, or state, for the
    application. It exports two functions that allow other
    modules to get copies of the state.

*/
const database = {
    styles: [
        { id: 1, style: "Classic", price: 500 },
        { id: 2, style: "Modern", price: 710 },
        { id: 3, style: "Vintage", price: 965 }
    ],
    sizes: [
        { id: 1, carets: 0.5, price: 405 },
        { id: 2, carets: 0.75, price: 782 },
        { id: 3, carets: 1, price: 1470 },
        { id: 4, carets: 1.5, price: 1997 },
        { id: 5, carets: 2, price: 3638 }
    ],
    metals: [
        { id: 1, metal: "Sterling Silver", price: 12.42 },
        { id: 2, metal: "14K Gold", price: 736.4 },
        { id: 3, metal: "24K Gold", price: 1258.9 },
        { id: 4, metal: "Platinum", price: 795.45 },
        { id: 5, metal: "Palladium", price: 1241.0 }
    ],
    customOrders: [
        {
            id: 1,
            metalId: 3,
            sizeId: 2,
            styleId: 3,
            timestamp: 1614659931693
        }
    ]
}

export const getMetals = () => {
    return database.metals.map(metal => ({...metal}))
}
' > ./scripts/database.js

echo '
import { DiamondSizes } from "./DiamondSizes.js"
import { JewelryStyles } from "./JewelryStyles.js"
import { Orders } from "./Orders.js"

document.addEventListener(
    "click",
    (event) => {
    }
)

export const KneelDiamonds = () => {
    return `
        <h1>Kneel Diamonds</h1>

        <article class="choices">
            <section class="choices__metals options">
                <h2>Metals</h2>
            </section>
            <section class="choices__sizes options">
                <h2>Sizes</h2>
            </section>
            <section class="choices__styles options">
                <h2>Styles</h2>
            </section>
        </article>

        <article>
            <button id="orderButton">Create Custom Order</button>
        </article>

        <article class="customOrders">
            <h2>Custom Jewelry Orders</h2>
        </article>
    `
}
' > ./scripts/KneelDiamonds.js

echo 'import { getOrders } from "./database.js"

const buildOrderListItem = (order) => {
    return `<li>
        Order #${order.id} was placed on ${order.timestamp}
    </li>`
}

export const Orders = () => {
    /*
        Can you explain why the state variable has to be inside
        the component function for Orders, but not the others?
    */
    const orders = getOrders()

    let html = "<ul>"

    const listItems = orders.map(buildOrderListItem)

    html += listItems.join("")
    html += "</ul>"

    return html
}
' > ./scripts/Orders.js

echo 'import { getMetals } from "./database.js"

const metals = getMetals()

document.addEventListener(
    "change",
    (event) => {
    }
)

export const Metals = () => {
    let html = "<ul>"

    // This is how you have been converting objects to <li> elements
    for (const metal of metals) {
        html += `<li>
            <input type="radio" name="metal" value="${metal.id}" /> ${metal.metal}
        </li>`
    }

    html += "</ul>"
    return html
}
' > ./scripts/Metals.js

echo 'import { getStyles } from "./database.js"

const styles = getStyles()

document.addEventListener(
    "change",
    (event) => {
    }
)

export const JewelryStyles = () => {
    let html = "<ul>"

    // Use .map() for converting objects to <li> elements
    const listItemsArray =


    // Join all of the strings in the array into a single string
    html += listItems.join("")

    html += "</ul>"
    return html
}
' > ./scripts/JewelryStyles.js


echo 'import { getSizes } from "./database.js"

const sizes = getSizes()

document.addEventListener(
    "change",
    (event) => {
        if (event.target.name === "size") {
            window.alert(``)
        }
    }
)

export const DiamondSizes = () => {
    let html = "<ul>"

    // Use .map() for converting objects to <li> elements
    const listItems = sizes.map(size => {
        return `<li>
            <input type="radio" name="size" value="${size.id}" /> ${size.carets}
        </li>`
    })

    html += listItems.join("")
    html += "</ul>"

    return html
}
' > ./scripts/DiamondSizes.js

