# Bringing It All Together in the Main Module

In this chapter, we will create the main JavaScript module that orchestrates the movie card generation and rendering process. This module will import the necessary modules, generate the movie cards HTML, and render them to the DOM.

## Step 1: Create the `main.js` Module

Inside the `scripts` directory, locate the `main.js` file. This module will serve as the entry point of our application.

## Step 2: Import the Required Modules

Open the `main.js` file in a text editor and add the following code at the top:

```javascript
import { generateMoviesHTML } from './movie-converter.js';
import { renderMoviesToDOM } from './movie-render.js';
```

These lines import the `generateMoviesHTML` function from the `movie-converter.js` module and the `renderMoviesToDOM` function from the `movie-render.js` module. These functions are necessary for generating the movie cards HTML and rendering them to the DOM.

## Step 3: Generate the Movie Cards HTML

In the `main.js` file, add the following code:

```javascript
const movieHTML = generateMoviesHTML();
```

This line calls the `generateMoviesHTML` function, which generates the HTML markup for the movie cards based on the movie data. The generated HTML is stored in the `movieHTML` variable.

## Step 4: Render the Movie Cards to the DOM

After generating the movie cards HTML, we need to render it to the DOM. In the `main.js` file, add the following code:

```javascript
renderMoviesToDOM(movieHTML);
```

This line calls the `renderMoviesToDOM` function, passing the `movieHTML` as an argument. The function takes the generated HTML and inserts it into the specified DOM element (`"movie-list"`).

## Step 5: Test the Application

1. In the project directory, run the `serve` command
2. Open the URL is provides in your browser _(this is usually http://lcoalhost:3000)_
3. You should see the movie cards displayed on the webpage, with the movie posters, titles, and descriptions.

## Step 6: Add to Commit History

Run `git add .` in your terminal to stage this new file to be committed.

Run `git commit -m "Implemented main algorithm in main module"` to add to your commit history for this project.

Then push your code to Github.

## Explanation

In this chapter, we brought everything together in the main module (`main.js`). We imported the necessary functions from the `movie-converter.js` and `movie-render.js` modules to generate the movie cards HTML and render them to the DOM.

The `main.js` module serves as the entry point of our application. It orchestrates the movie card generation and rendering process by calling the appropriate functions.

First, we call the `generateMoviesHTML` function to generate the HTML markup for the movie cards based on the movie data. The generated HTML is stored in the `movieHTML` variable.

Next, we call the `renderMoviesToDOM` function, passing the `movieHTML` as an argument. This function takes the generated HTML and inserts it into the specified DOM element (`"movie-list"`), effectively displaying the movie cards on the webpage.

By separating concerns into different modules (`movies-data.js`, `movie-converter.js`, `movie-render.js`), we achieve a modular and maintainable codebase. Each module has a specific responsibility, making the code easier to understand and modify.

## Conclusion

Congratulations! You have successfully built a movie showcase application using JavaScript modules, HTML, and CSS. You have learned how to:

- Create and structure a project with multiple JavaScript modules
- Store and import movie data using JavaScript objects and arrays
- Generate HTML markup dynamically based on movie data
- Render the generated HTML to the DOM
- Use CSS to style the movie cards and create an appealing layout

Feel free to enhance the application further by adding more movies to the `movies` array, styling the movie cards differently, or implementing additional features like sorting or filtering the movies.
