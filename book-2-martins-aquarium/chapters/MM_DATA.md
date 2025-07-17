# Creating the Movie Data

In this chapter, we will create the movie data that will be used to generate the movie cards in our showcase. We'll store the movie data in a JavaScript file as an array of objects, where each object represents a movie with its properties.

## Step 1: Create the `movies-data.js` File

Inside the `scripts` directory, create a new file named `movies-data.js`. This file will contain our movie data.

## Step 2: Define the Movie Data

Open the `movies-data.js` file in a text editor and add the following JavaScript code:

```javascript
export const movies = [
   {
       title: "Inception",
       poster: "https://fr.web.img6.acsta.net/medias/nmedia/18/72/34/14/19453822.jpg",
       description: "A skilled thief is tasked with planting an idea in someone's subconscious mind."
   },
   {
       title: "The Matrix",
       poster: "https://image.tmdb.org/t/p/original/309gy3jIti5UDEPGiisNpRDv6Pa.jpg",
       description: "A computer hacker learns the true nature of his reality and his role in the war against the controllers of it."
   },
   {
       title: "Interstellar",
       poster: "https://assets.fontsinuse.com/static/use-media-items/21/20287/upto-700xauto/56703471/interstellar.jpeg?resolution=0",
       description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."
   },
   {
       title: "Jurassic Park",
       poster: "https://i.pinimg.com/originals/58/2b/7e/582b7e5803b80101ada6114d176f5f16.jpg",
       description: "A pragmatic paleontologist visiting an almost complete theme park is tasked with protecting a couple of kids after a power failure causes the park's cloned dinosaurs to run loose."
   },
   {
       title: "The Lion King",
       poster: "https://www.movieartarena.com/imgs/lionkingintz.jpg",
       description: "Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself."
   }
];
```

In this code:
- We define an array called `movies` that contains objects representing movies.
- Each movie object has properties like `title`, `poster`, and `description`.
- We export the `movies` array using the `export` keyword to make it available for use in other files.

## Step 3: Add to Commit History

Run `git add .` in your terminal to stage this new file to be committed.

Run `git commit -m "Added database module"` to add to your commit history for this project.

Then push your code to Github.

## Explanation

Creating separate data files is a common practice in web development. It allows us to keep our data organized and separate from the application logic. By storing the movie data in a JavaScript file, we can easily import and use it in different parts of our application.

In this chapter, we created an array of movie objects, each containing properties like `title`, `poster`, and `description`. These properties provide the necessary information to generate the movie cards in our showcase.

Exporting the `movies` array using the `export` keyword allows us to import it in other files using the `import` statement. This way, we can access the movie data and use it to generate the movie cards dynamically.

In the next chapter, we will focus on converting the movie data into HTML markup to create the individual movie cards.
