#!/bin/bash
set -u

mkdir -p "$HOME/workspace/brewed-awakenings/scripts"
mkdir -p "$HOME/workspace/brewed-awakenings/styles"
cd "$HOME/workspace/brewed-awakenings"

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Brewed Awakenings</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main id="container">

        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' > index.html

echo '@import "detail.css";
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
' > ./styles/main.css

echo '.details {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
}

.detail--column {
    flex-basis: 24%;
    margin: 0 2rem;
    padding: 1rem;
    border: 1px dotted goldenrod;
}

.orders {
    font-size: 20rem;
}
' > ./styles/details.css

echo 'import { Employees } from "./Employees.js"
import { Orders } from "./Order.js"
import { Products } from "./Products.js"

const mainContainer = document.querySelector("#container")

const applicationHTML = `
<h1>Brewed Awakenings</h1>
<article class="details">
    <section class="detail--column list details__employees">
        <h2>Employees</h2>
        ${Employees()}
    </section>
    <section class="detail--column list details__products">
        <h2>Products</h2>
        ${Products()}
    </section>
</article>

<article class="orders">
    <h2>Orders</h2>
    ${Orders()}
</article>
`

mainContainer.innerHTML = applicationHTML
' > ./scripts/main.js

echo '/*

    This module contains all of the data, or state, for the
    application. It exports two functions that allow other
    modules to get copies of the state.

*/
const database = {
    employees: [{
        id: 1,
        name: "Alphonse Meron",
        email: "ameron0@mashable.com",
        hourlyRate: 11.50

    }, {
        id: 2,
        name: "Damara Pentecust",
        email: "dpentecust1@apache.org",
        hourlyRate: 10.75

    }, {
        id: 3,
        name: "Anna Bowton",
        email: "abowton2@wisc.edu",
        hourlyRate: 12.30

    }, {
        id: 4,
        name: "Hunfredo Drynan",
        email: "hdrynan3@bizjournals.com",
        hourlyRate: 12.00

    }, {
        id: 5,
        name: "Elmira Bick",
        email: "ebick4@biblegateway.com",
        hourlyRate: 12.30

    }, {
        id: 6,
        name: "Bernie Dreger",
        email: "bdreger5@zimbio.com",
        hourlyRate: 11.50

    }, {
        id: 7,
        name: "Rolando Gault",
        email: "rgault6@google.com",
        hourlyRate: 11.80

    }, {
        id: 8,
        name: "Tiffanie Tubby",
        email: "ttubby7@intel.com",
        hourlyRate: 21.00

    }, {
        id: 9,
        name: "Tomlin Cutill",
        email: "tcutill8@marketwatch.com",
        hourlyRate: 12.10

    }, {
        id: 10,
        name: "Arv Biddle",
        email: "abiddle9@cafepress.com",
        hourlyRate: 13.00

    }],
    products: [{
        id: 1, name: "Large Coffee", price: 6.00
    }, {
        id: 2, name: "Latte", price: 8.99
    }, {
        id: 3, name: "Blueberry Muffin", price: 9.49
    }, {
        id: 4, name: "Scone", price: 7.56
    }, {
        id: 5, name: "Bran Muffin", price: 9.10
    }, {
        id: 6, name: "Mocha Latte", price: 12.99
    }, {
        id: 7, name: "Espresso", price: 11.80
    }, {
        id: 8, name: "Americano", price: 11.00
    }, {
        id: 9, name: "Cubano", price: 14.99
    }, {
        id: 10, name: "Cappucino", price: 12.49
    }],
    orders: [{
        id: 1, productId: 10, employeeId: 5, timestamp: 1613538111396
    }, {
        id: 2, productId: 5, employeeId: 1, timestamp: 1613038102396
    }, {
        id: 3, productId: 2, employeeId: 7, timestamp: 1612837112396
    }, {
        id: 4, productId: 8, employeeId: 5, timestamp: 1612836112396
    }, {
        id: 5, productId: 9, employeeId: 7, timestamp: 1612735112396
    }, {
        id: 6, productId: 4, employeeId: 1, timestamp: 1614528112396
    }, {
        id: 7, productId: 5, employeeId: 8, timestamp: 1614598112396
    }, {
        id: 8, productId: 2, employeeId: 9, timestamp: 1614630112396
    }, {
        id: 9, productId: 3, employeeId: 2, timestamp: 1612538112396
    }, {
        id: 10, productId: 9, employeeId: 6, timestamp: 1612438112396
    }, {
        id: 11, productId: 4, employeeId: 1, timestamp: 1612338112396
    }, {
        id: 12, productId: 6, employeeId: 11, timestamp: 1612238112396
    }, {
        id: 13, productId: 10, employeeId: 8, timestamp: 1630538112396
    }, {
        id: 14, productId: 9, employeeId: 9, timestamp: 1612738112396
    }, {
        id: 15, productId: 3, employeeId: 3, timestamp: 1612938112396
    }, {
        id: 16, productId: 4, employeeId: 7, timestamp: 1612638112396
    }, {
        id: 17, productId: 4, employeeId: 10, timestamp: 1612638112396
    }]
}

export const getProducts = () => {
    return database.products.map(product => ({...product}))
}

export const getEmployees = () => {
    return database.employees.map(employee => ({...employee}))
}

export const getOrders = () => {
    return database.orders.map(order => ({...order}))
}
' > ./scripts/database.js

echo 'import { getProducts } from "./database.js"

const products = getProducts()

export const Products = () => {
    let html = "<ul>`

    for (const product of products) {
        html += `<li>${product.title}</li>`
    }

    html += "</ul>"

    return html
}
' > ./scripts/Products.js

echo 'import { getEmployees } from "./database.js"

const employees = getEmployees()

export const Employees = () => {
    let html = "<ul>"

    for (const employee of employees) {
        html += `<li>${employee.name}</li>`
    }

    html += "</ul>"

    return htm
}
' > ./scripts/Employees.js

echo 'import { getProducts, getEmployees, getOrders } from "./database.js"

// Get copy of state for use in this module
const products = getProducts()
const employees = getEmployees()
const orders = getOrders()


// Function whose responsibility is to find the product for an order
const findproduct = (order, allProducts) => {
    let orderProduct = null

    for (const product of allProducts) {
        if (product.id === order.productId) {
            orderProduct = product
        }
    }

    return orderProduct
}

// Function whose responsibility is to find the employee for an order
const findemployee = (order, allEmployees) => {
    let orderEmployee = null

    for (const employee in allEmployees) {
        if (employee.id === order.employeeId) {
            orderEmployee = employee
        }
    }

    return orderEmployee
}

export const Orders = () => {
    let html = ""
    html = "<ul>"

    for (const order of orders) {
        const employee = findEmployee(order, employees)
        const product = findProduct(order)

        html += `<li>${product.name} was sold by ${employee.name} on ${new Date(order.timestamp).toLocaleDateString()}</li>`
    }

    html += "</ul>"

    return html
}
' > ./scripts/Orders.js

