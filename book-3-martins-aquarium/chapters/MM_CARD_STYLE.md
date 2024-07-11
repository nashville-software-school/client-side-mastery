# Styling the Movie Cards with CSS

In this chapter, we will focus on styling the movie cards using CSS to create an attractive and visually appealing layout. We will define styles for the movie cards, including the movie poster, title, and description, to enhance the overall presentation of our movie showcase.

## Step 1: Open the `main.css` File

Inside the `styles` directory, locate the `main.css` file. This file will contain the CSS styles for our movie cards.

## Step 2: Style the Movie Cards

Open the `main.css` file in a text editor and add the following CSS code:

```css
.movie {
    flex-basis: 300px;
    flex-grow: 1;
    max-width: 400px;
    margin-bottom: 20px;
    display: flex;
    flex-direction: row;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    transition: transform 0.3s ease;
}

.movie:hover {
    transform: translateY(-5px);
    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.6);
}

.movie__poster {
    max-width: 10rem;
}

.movie__details {
    padding: 20px;
}

.movie__title {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #333333;
}

.movie__description {
    font-size: 14px;
    color: #666666;
    line-height: 1.5;
}
```

Let's break down the CSS code:

- `.movie`: This class selector targets each movie card. We apply the following styles:
  - `flex-basis: 300px;` to set the initial size of the movie card to 300 pixels.
  - `flex-grow: 1;` to allow the movie card to grow and fill the available space.
  - `max-width: 400px;` to set a maximum width of 400 pixels for the movie card.
  - `margin-bottom: 20px;` to add some vertical spacing between movie cards.
  - `display: flex;` to create a flex container, allowing the movie poster and details to be displayed side by side.
  - `flex-direction: row;` to arrange the movie poster and details horizontally.
  - `background-color: #ffffff;` to set a white background color for the movie card.
  - `border-radius: 8px;` to add rounded corners to the movie card.
  - `box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);` to apply a shadow effect, giving the movie card a raised appearance.
  - `overflow: hidden;` to ensure the content stays within the movie card and the rounded corners are maintained.
  - `transition: transform 0.3s ease;` to add a smooth transition effect when hovering over the movie card.

- `.movie:hover`: This pseudo-class selector targets the movie card when it is being hovered over. We apply the following styles:
  - `transform: translateY(-5px);` to slightly lift the movie card upwards when hovered.
  - `box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.6);` to apply a more prominent shadow effect when the movie card is hovered, enhancing the visual feedback.

- `.movie__poster`: This class selector targets the movie poster image. We apply the following style:
  - `max-width: 10rem;` to set a maximum width of 10 rem (relative unit) for the movie poster, ensuring it doesn't exceed a certain size.

- `.movie__details`: This class selector targets the movie details container. We apply the following style:
  - `padding: 20px;` to add some inner spacing within the movie details container.

- `.movie__title`: This class selector targets the movie title. We apply the following styles:
  - `font-size: 20px;` to set a larger font size for the movie title.
  - `font-weight: bold;` to make the movie title bold.
  - `margin-bottom: 10px;` to add some spacing below the movie title.
  - `color: #333333;` to set a dark gray color for the movie title text.

- `.movie__description`: This class selector targets the movie description. We apply the following styles:
  - `font-size: 14px;` to set a smaller font size for the movie description.
  - `color: #666666;` to set a lighter gray color for the movie description text.
  - `line-height: 1.5;` to set the line height for better readability.

## Step 3: Test the Styling

Save the `main.css` file and refresh the page in your web browser. You should now see the movie cards styled with the defined CSS, creating a visually appealing style for each one.

## Step 4: Add to Commit History

Run `git add .` in your terminal to stage this new file to be committed.

Run `git commit -m "Added main CSS module and initial styles"` to add to your commit history for this project.

Then push your code to Github.

## Explanation

In this chapter, we styled the movie cards using CSS to enhance their visual presentation. We defined styles for the movie card container, movie poster, movie title, and movie description.

We applied background color, border radius, and box shadow to the movie card to create a visually appealing card-like appearance. The `overflow: hidden` property ensures that the content stays within the card and the rounded corners are maintained.

The `:hover` pseudo-class selector is used to apply additional styles when the movie card is being hovered over. We used the `transform` property to slightly lift the card upwards and increased the box shadow intensity to provide visual feedback and enhance the interactive experience.

We also styled the movie title and description by setting appropriate font sizes, colors, and spacing to improve readability and visual hierarchy.

Feel free to further customize the styles based on your design preferences. You can experiment with different colors, fonts, spacing, and additional CSS properties to create a unique and visually striking movie showcase.

In the next chapter, we will explore how to arrange the movie cards in a grid layout using CSS Flexbox to create a responsive and visually appealing movie showcase.