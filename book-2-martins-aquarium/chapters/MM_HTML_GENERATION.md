# Converting Movie Data to HTML

In this chapter, we will create a JavaScript module that converts the movie data into HTML markup. This module will generate the necessary HTML structure for each movie card based on the movie data imported from the `movies-data.js` file.

> 📖 Vocabulary: Serialization
>
> Serialization refers to the process of converting an object or data structure into a format that can be stored, transmitted, or reconstructed later. In this project, the JavaScript objects representing the movie data are being converted into an HTML string format. This process of converting the movie objects to HTML is a form of serialization.

## Step 1: Create the `movie-converter.js` Module

Inside the `scripts` directory, create a new file named `movie-converter.js`. This module will contain the logic to generate the HTML markup for the movie cards.

## Step 2: Import the Movie Data

Open the `movie-converter.js` file in a text editor and add the following code at the top:

```javascript
import { movies } from './movies-data.js';
```

This line imports the `movies` array from the `movies-data.js` file, making it available for use in the `movie-converter.js` module.

## Step 3: Create the HTML Generation Function

In the `movie-converter.js` file, add the following code:

```javascript
export const generateMoviesHTML = () => {
   let movieHTML = '';

   for (const movie of movies) {
       movieHTML += `
           <article class="movie">
               <img src="${movie.poster}" alt="${movie.title} poster" class="movie__poster">
               <div class="movie__details">
                   <h2 class="movie__title">${movie.title}</h2>
                   <p class="movie__description">${movie.description}</p>
               </div>
           </article>
       `;
   }

   return movieHTML
};
```

Let's break down the code:
- We define a function called `generateMoviesHTML` using an arrow function syntax.
- Inside the function, we initialize an empty string variable called `movieHTML` to store the generated HTML markup.
- We use a `for...of` loop to iterate over each `movie` object in the `movies` array.
- For each `movie`, we generate an HTML structure using template literals:
  - We create an `<article>` element with the class `"movie"` to represent each movie card.
  - Inside the `<article>`, we have an `<img>` element that displays the movie poster image. The `src` attribute is set to the `poster` property of the movie object, and the `alt` attribute is set to the movie title followed by "poster" for accessibility.
  - We also have a `<div>` element with the class `"movie__details"` to hold the movie title and description.
  - The movie title is wrapped in an `<h2>` element with the class `"movie__title"`.
  - The movie description is wrapped in a `<p>` element with the class `"movie__description"`.
- We concatenate each generated movie HTML to the `movieHTML` string.
- Finally, we return the `movieHTML` string containing the generated HTML markup for all the movies.

## Step 4: Export the HTML Generation Function

To make the `generateMoviesHTML` function accessible from other modules, we export it using the `export` keyword.

## Step 5: Add to Commit History

Run `git add .` in your terminal to stage this new file to be committed.

Run `git commit -m "Added HTML generation module"` to add to your commit history for this project.

Then push your code to Github.

## Explanation

In this chapter, we created a JavaScript module that converts the movie data into HTML markup. By importing the movie data from the `movies-data.js` file, we can access the `movies` array and iterate over each movie object.

Inside the `generateMoviesHTML` function, we use a `for...of` loop to go through each movie object and generate the corresponding HTML structure using template literals. We dynamically insert the movie poster, title, and description into the appropriate elements.

The generated HTML markup for each movie is concatenated into the `movieHTML` string, which is then returned by the function. This allows us to obtain the complete HTML markup for all the movies.

By exporting the `generateMoviesHTML` function, we make it available for use in other modules, such as the main module where we will render the movie cards to the DOM.

In the next chapter, we will focus on rendering the generated movie HTML to the DOM and displaying the movie cards in the browser.

## What is the DOM?

We've used that acronym a couple times but never explain what it means. You are encouraged to use Google or a generative AI tool to learn about this acronym yourself. It's an important term to understand.