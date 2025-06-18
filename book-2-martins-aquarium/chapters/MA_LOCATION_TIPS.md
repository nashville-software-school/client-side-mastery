# Rendering Care Tips and Location List

In this chapter, we will create the care tips and location list in the aquarium showcase. Similar to how we created the fish list, you will need to create separate keys in your database, and then create corresponding components to render them in the showcase.

## Step 1: Create the Tip Data

Create a new key in your database named `tips` that will be an array of tip objects.

Here's an example tip object:

```javascript
{
   topic: "Water Temperature",
   text: "Maintain a consistent water temperature between 75-80°F (24-27°C) for most tropical fish."
}
```

## Step 2: Create the Tip List Component

Open the file named `tipList.js` in the `scripts` directory. In this file, you will need to do the following:

1. Import the database.
2. Create an exported function `tipList` that returns the HTML for the list of tips to be rendered in the DOM.
3. Use a loop to generate the HTML for each tip. Render each tip as an `<li class="tip">` element inside a `<ul class="tips">` element.

## Step 3: Create the Location Data

Create a new key in your database named `locations` that will be an array of location objects.

Here's an example location object:

```javascript
{
   name: "Great Barrier Reef",
   country: "Australia",
   description: "The Great Barrier Reef is the world's largest coral reef system, supporting a diverse array of marine life."
}
```

## Step 4: Create the Location List Component

Open the file named `locationList.js` in the `scripts` directory, and build the function to generate the HTML representations of each location.

Define each location as a `<section>` element with the class `location` inside an `<article>` element with the class `locations`.

## Step 5: Update the Main Module

Open the `main.js` file in the `scripts` directory and ensure that the `tipList` and `locationList` functions are imported and called.

Then update the inner HTML of the correct DOM elements.

## Step 6: Test the Aquarium Showcase

Open the `index.html` file in a web browser and verify that the care tips and location list are displayed in the aquarium showcase.

Congratulations! You have now implemented the basic functionality of Martin's Aquarium showcase.

Next chapter: [Styling and Layout >](./MA_LAYOUT.md)