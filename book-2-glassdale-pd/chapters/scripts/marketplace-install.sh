#!/bin/bash
set -u

mkdir -p $HOME/workspace/marketplace/api
mkdir -p $HOME/workspace/marketplace/scripts
mkdir -p $HOME/workspace/marketplace/styles
cd $HOME/workspace/marketplace

echo '{
    "productTypes": [
        { "id": 1, "name": "Candy" },
        { "id": 2, "name": "Electronics" }
    ],
    "products": [
        { "id": 1, "name": "Lollipop", "price": 1.49, "productTypeId": 1 },
        { "id": 2, "name": "iPad", "price": 799.99, "productTypeId": 2 },
        { "id": 3, "name": "Snickers", "price": 1.79, "productTypeId": 1 },
        { "id": 4, "name": "Baby Ruth", "price": 1.79, "productTypeId": 1 },
        { "id": 5, "name": "Xbox One", "price": 216.49, "productTypeId": 2 }
    ]
}
' > ./api/database.json

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Product Marketplace</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main class="container">
            <div class="products"></div>
        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' > index.html

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

.blue {
    background-color: aliceblue;
}

.green {
    background-color: darkseagreen;
}

.purple {
    background-color: mediumorchid;
}

.red {
    background-color: darksalmon;
}

.product {
    padding: 0 3rem;
}
' > ./styles/main.css

echo 'import { getProducts } from "./ProductProvider.js"
import { getProductTypes } from "./ProductTypeProvider.js"
import { ProductList } from "./ProductList.js"

getProducts()
    .then(getProductTypes)
    .then(ProductList)
' > ./scripts/main.js

echo 'export const Product = (product, type) => {
    return `
        <section class="product">
            <header>
                <h2 class="red">${product.name}</h2>
            </header>
            <div>
                Price $${product.price}
            </div>
            <div>
                In category ${type.name}
            </div>
        </section>
    `
}
' > ./scripts/Product.js

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
' > ./scripts/ProductList.js

echo 'let products = []

export const useProducts = () => products.slice()

export const getProducts = () => fetch("http://localhost:8088/products")
    .then(res => res.json())
    .then(parsedProducts => products = parsedProducts)
' > ./scripts/ProductProvider.js

echo 'let types = []

export const useProductTypes = () => types.slice()

export const getProductTypes = () => fetch("http://localhost:8088/producttypes")
    .then(res => res.json())
    .then(parsedTypes => types = parsedTypes)
' > ./scripts/ProductTypeProvider.js
