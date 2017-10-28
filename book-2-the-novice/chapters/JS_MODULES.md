# Browserify Modules



## Plugins You Need to Install

1. [eslint-grunt](https://www.npmjs.com/package/eslint-grunt): For verifying your JavaScript against community standards, and checking sytax
1. [grunt-contrib-uglify](https://www.npmjs.com/package/grunt-contrib-uglify): For minifying your code to make HTTP calls faster
1. [grunt-browserify](https://www.npmjs.com/package/grunt-browserify): For compiling your modules into a single application

## Practice: Product Ordering

Your task is to simulate a product listing page like you would find on Etsy, Amazon, or Ebay. This application should implement the following features.

1. Display a product. Each product should have a title, short description, price, quantity, and an image.
1. Display the application information in a navigation bar at the top of the page.
    1. The name of the company - Betsy
    1. Three links: *Categories*, *Orders*, and *Log Out*
1. Display 3 product reviews beneath the product listing. You can use [hipster ipsum](https://hipsum.co/) for the reviews themselves.

Each of those features is a separate component, and you must write your code as modular as possible with Browserify.

1. One module contains the product information (i.e. productFactory)
1. One module displays the product information (i.e. product Controller)
1. One module builds the navigation bar
1. One module contains the review information (i.e. reviewFactory)
1. One module displays the review information (i.e. reviewController)

## Technical Requirements

1. While you are developing, make sure Grunt is verifying your JavaScript syntax every time you save a file.
1. Grunt should be compiling your modules each time you save a JavaScript file.
1. Grunt should be minifying your code each time you save a JavaScript file.
