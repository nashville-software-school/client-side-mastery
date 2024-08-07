# Rendering Movie Cards to the DOM

In this chapter, we will create a JavaScript module that renders the generated movie HTML to the DOM (Document Object Model). This module will take the HTML markup generated by the `movie-converter.js` module and insert it into the appropriate element on the webpage.

## Step 1: Create the `movie-render.js` Module

Inside the `scripts` directory, create a new file named `movie-render.js`. This module will contain the logic to render the movie cards to the DOM.

## Step 2: Define the Render Function

Open the `movie-render.js` file in a text editor and add the following code:

```javascript
export const renderMoviesToDOM = (movieHTML) => {
   const movieList = document.getElementById('movie-list');

   if (movieList) {
       movieList.innerHTML = movieHTML;
   } else {
       console.error('Could not find element with id "movie-list"');
   }
};
```

Let's break down the code:
- We define a function called `renderMoviesToDOM` that accepts a parameter `movieHTML`, which represents the HTML markup of the movie cards.
- Inside the function, we use `document.getElementById('movie-list')` to select the DOM element with the ID `"movie-list"`. This is the element where we want to insert the movie cards.
- We store the selected element in the `movieList` variable.
- We then check if the `movieList` element exists using an `if` statement:
  - If `movieList` exists (truthy), we set its `innerHTML` property to the `movieHTML` received as a parameter. This effectively inserts the movie cards HTML into the `"movie-list"` element.
  - If `movieList` is `null` or `undefined` (falsy), indicating that no element with the ID `"movie-list"` was found, we log an error message to the console using `console.error()`. This helps in identifying and debugging issues related to missing or incorrect DOM elements.

## Step 3: Export the Render Function

To make the `renderMoviesToDOM` function accessible from other modules, we export it using the `export` keyword.

## Step 4: Add to Commit History

Run `git add .` in your terminal to stage this new file to be committed.

Run `git commit -m "Added HTML rendering module"` to add to your commit history for this project.

Then push your code to Github.

## Explanation

In this chapter, we created a JavaScript module that renders the movie cards HTML to the DOM. The `renderMoviesToDOM` function takes the generated HTML markup as a parameter and inserts it into the specified DOM element.

We use `document.getElementById('movie-list')` to select the DOM element with the ID `"movie-list"`. This assumes that there is an element in the HTML file with the corresponding ID where we want to display the movie cards.

By setting the `innerHTML` property of the `movieList` element to the `movieHTML`, we effectively insert the movie cards HTML into the webpage. This allows the movie cards to be visible and rendered in the browser.

We include error handling using an `if` statement to check if the `movieList` element exists. If it doesn't exist, we log an error message to the console to help with debugging.

Exporting the `renderMoviesToDOM` function allows us to use it in other modules, such as the main module where we will orchestrate the movie card generation and rendering process.

In the next chapter, we will bring everything together in the main module, where we will import the necessary modules, generate the movie cards HTML, and render them to the DOM.