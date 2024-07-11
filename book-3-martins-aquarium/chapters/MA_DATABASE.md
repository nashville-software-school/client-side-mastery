# Creating Fish Data and Rendering the Fish List

In this chapter, we will create the fish data and render the fish list in the aquarium showcase. We'll define the fish data in a separate module and create a function to generate the HTML for the fish list.

## Step 1: Create the Fish Data

Open the file named `aquariumData.js` in the `scripts` directory and add the following code. Add at least 5 more fish with some valid URLs of fish images you can find on the Web.

```javascript
export const database = {
    fish: [
        {
            name: "Nemo",
            species: "Clownfish",
            length: 3,
            location: "Great Barrier Reef",
            diet: "Omnivore",
            image: "https://example.com/images/nemo.jpg"
        },
        {
            name: "Dory",
            species: "Blue Tang",
            length: 5,
            location: "Great Barrier Reef",
            diet: "Omnivore",
            image: "https://example.com/images/dory.jpg"
        },
    ]
}
```

In this `aquariumData.js` file, we define the database object with an initial key of an array called `fish` that contains objects representing each fish. Each fish object has properties such as `name`, `species`, `length`, `location`, `diet`, and `image`.

## Step 2: Create the Fish List Component

Create a new file named `fishList.js` in the `scripts` directory and add the following code:

```javascript
import { database } from './aquariumData.js';

export const fishList = () => {
    // Generate an HTML representation of each fish
};
```

## Step 3: Update the Main Module

Open the `main.js` file in the `scripts` directory and verify that the following code exists.

```javascript
import { fishList } from './fishList.js'

// ... other code...

const fishHTML = fishList()
```

This code ensures that the `fishList` function is imported from the `fishList.js` module and called to generate the fish list in the aquarium showcase.

## Step 4: Render the Fish List

Under the following comment.

```js
// Render each HTML string to the correct DOM element
```

Your job is to target the correct DOM element and update its inner HTML with the value of the `fishHTML` variable.

## Step 4: Test the Fish List

Refresh your web browser and verify that the fish list is displayed in the aquarium showcase. You should see a simple list of fish cards with the fish details populated from the `aquariumData.js` module.

Next chapter: [Locations and Tips >](./MA_LOCATION_TIPS.md)