#!/bin/bash
set -u

mkdir -p $HOME/workspace/statefair
mkdir -p $HOME/workspace/statefair/scripts/rides
mkdir -p $HOME/workspace/statefair/scripts/food
mkdir -p $HOME/workspace/statefair/scripts/games
mkdir -p $HOME/workspace/statefair/scripts/sideshows
mkdir -p $HOME/workspace/statefair/styles
cd $HOME/workspace/statefair


echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>State Fair</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main id="state-fair">
            <section class="customers"> </section>
            <section class="entry"> </section>
            <section class="attractions">
                <div class="attraction">
                    <h1>Rides</h1>
                    <div class="people rides"></div>
                </div>
                <div class="attraction">
                    <h1>Food</h1>
                    <div class="people food"></div>
                </div>
                <div class="attraction">
                    <h1>Games</h1>
                    <div class="people games"></div>
                </div>
                <div class="attraction">
                    <h1>Sideshow</h1>
                    <div class="people sideshow"></div>
                </div>
            </section>
        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' >> index.html

echo '@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

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

.ticketBooth {
    margin-bottom: 1rem;
}

.attractions {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    height: 30rem;
}

.attraction {
    flex: 1;
    border-left: 1px dashed gray;
    border-right: 1px dashed gray;
    text-align: center;
}

.people {
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    height: 25rem;
}

.person {
    height: 1rem;
    width: 1rem;
    margin: 0.2rem 0.2rem;
}

.eater {
    background-color: fuchsia;
}

.rider {
    background-color: dodgerblue;
}

.bigSpender {
    background-color: orange;
}

.player {
    background-color: lawngreen;
}

.gawker {
    background-color: firebrick;
}

.customers {
    font-weight: 700;
    padding: 1rem;
}
' >> ./styles/main.css

echo 'const contentTarget = document.querySelector(".entry")
const eventHub = document.querySelector("#state-fair")

contentTarget.addEventListener()

export const TicketBooth = () => {
    contentTarget.innerHTML = `
        <div class="ticketBooth">
            Add button here
        </div>
    `
}
' >> ./scripts/TicketBooth.js

echo 'import { useProducts } from "./ProductProvider.js"
import { useProductTypes } from "./ProductTypeProvider.js"
import { Product } from "./Product.js"

const contentTarget = document.querySelector(".products")

export const ProductList = () => {
    // Get a reference to both arrays
    const products = useProducts()
    const productTypes = useProductTypes()

    // Iterate the array of products with .map()
    const arrayOfProductHTMLRepresentations = products.map(product => {

        /*
            Find the type for this product by using the .find()
            method on the product type array
        */
        const type = productTypes.find(type => type.id === product.productTypeId)

        // Build HTML representation of a product
        const html = Product(product, type)

        return html
    })

    const stringOfAllRepresentations = arrayOfProductHTMLRepresentations.join("")

    contentTarget.innerHTML = stringOfAllRepresentations
}
' >> ./scripts/ProductList.js

echo 'const contentTarget = document.querySelector(".rides")
const eventHub = document.querySelector("#state-fair")

export const RideTicketHolders = () => {
    eventHub.addEventListener("rideTicketPurchased", customEvent => {
        contentTarget.innerHTML += `
            <div class="person rider"> </div>
        `
    })
    eventHub.addEventListener("packageTicketPurchased", customEvent => {
        contentTarget.innerHTML += `
            <div class="person bigSpender"> </div>
        `
    })
}
' >> ./rides/RideTicketHolders.js

echo '// Import and invoke the ticket booth component function
' >> ./scripts/main.js
