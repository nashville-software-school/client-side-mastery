# Displaying Submissions with .map()

In the previous chapter, we implemented the ability to save survey submissions to our database. Now, we need to display those submissions on the page. This will require us to:

1. Fetch the existing submissions from the database
2. Generate HTML for each submission
3. Add the generated HTML to our page

For this task, we'll leverage the `.map()` array method, which is an essential tool for working with collections of data in JavaScript.

## Creating the SubmissionList Component

Let's start by creating a new component that will be responsible for fetching and generating html for our submissions.

Create a new file called `SubmissionList.js` in your `scripts` directory and start writing the `SubmissionList` component function. The html returned from this function will be a `div` with an id of `survey-submission-list`. The div will contain an `h2` that says "Survey Submissions" and a list of all the submissions. Don't worry about generating the html for all the submissions yet, we'll use `.map` for this. Don't forget to fetch the submissions from the api!

<details>
  <summary>Expand the code below if you need help:</summary>

  ```javascript
  export const SubmissionList = async () => {
      // Fetch the submissions from your API
      const response = await fetch("http://localhost:8088/submissions")
      const submissions = await response.json()

      let html = `
          <div id='survey-submissions-list'>
              <h2>Survey Submissions</h2>
      `
      
      // TODO: Generate HTML for each submission
      
      html += `
          </div>
      `
      
      return html
  }
  ```
</details>

## Introduction to the .map() Method

Now that we have our submissions data, we need to generate HTML for each submission. This is where the `.map()` method becomes incredibly useful.

The `.map()` method creates a new array by applying a function to each element of the original array. In our case, we want to transform each submission object into an HTML string.

Here's how the `.map()` method works:

```javascript
const newArray = originalArray.map((item) => {
    return transformedItem;
});
```

Some key points about `.map()`:
1. It creates a new array without modifying the original
2. The function is called for each element in the array
3. The function's return value is added to the new array
4. The new array will have the same length as the original

## Generating HTML with .map()

Let's update our `SubmissionList` component to use `.map()` to generate HTML for each submission:

```javascript
export const SubmissionList = async () => {
    // Fetch the submissions from your API
    const response = await fetch("http://localhost:8088/submissions")
    const submissions = await response.json()

    let html = `
        <div id='survey-submissions-list'>
            <h2>Survey Submissions</h2>
    `
    
    // Generate HTML for each submission using .map()
    const submissionsHTML = submissions.map(
        (submission) => {
            return `
                <section class="survey-submission-container">
                    <h2>Submission ${submission.id}</h2>
                    <p>Owns Blue Jeans: ${submission.ownsBlueJeans}</p>
                    <p>Location ID: ${submission.socioLocationId}</p>
                </section>
            `
        }
    )

    // Join the array of strings into a single string and add to our HTML
    html += submissionsHTML.join("")
    
    html += `
        </div>
    `
    
    return html
}
```

What we've added:
1. We call `.map()` on our submissions array
2. For each submission, we return an HTML string with the submission details
3. We use `.join("")` to combine all the HTML strings into a single string
4. We add this combined string to our main HTML

The `.join("")` method is necessary because `.map()` returns an array, but we need a single string to add to our HTML. The empty string parameter means we want to join the array elements without any separator.

## Adding the SubmissionList to main.js

Now, let's update our `main.js` file to include the submission list:

```javascript
import { JeanChoices } from "./JeanChoices.js"
import { LocationChoices } from "./LocationChoices.js"
import { SubmissionButton } from "./SubmissionButton.js"
import { SubmissionList } from "./SubmissionList.js"

const container = document.querySelector("#container")

const render = async () => {
    const jeansHTML = JeanChoices()
    const locationsHTML = await LocationChoices()
    const buttonHTML = SubmissionButton()
    const submissionsHTML = await SubmissionList()

    container.innerHTML = `
        ${jeansHTML}
        ${locationsHTML}
        ${buttonHTML}
        ${submissionsHTML}
    `
}

render()
```

We've added:
1. An import for the `SubmissionList` component
2. A call to the `SubmissionList()` function (with `await` since it's async)
3. The submission list HTML in our container's content

## Exploring Related Data

Looking at our current output, you'll notice we're displaying the `socioLocationId` rather than the actual location name. This is because our submissions table only stores the ID reference to the socioLocations table.

Let's review our ERD:

```
+------------------+       +------------------+
|   submissions    |       |  socioLocations  |
+------------------+       +------------------+
| PK id            |       | PK id            |
| ownsBlueJeans    |       | label            |
| FK socioLocationId|----->|                  |
+------------------+       +------------------+
```

The `socioLocationId` in the submissions table is a foreign key that references the `id` in the socioLocations table. This allows us to establish a relationship between the two tables.

### Using the _expand Query Parameter

JSON Server provides a convenient way to include related data in our responses using the `_expand` query parameter. This allows us to retrieve the submission along with its related socioLocation in a single request.

Let's update our `SubmissionList` component to use this feature:

```javascript
export const SubmissionList = async () => {
    // Fetch the submissions with expanded socioLocation data
    const response = await fetch("http://localhost:8088/submissions?_expand=socioLocation")
    const submissions = await response.json()

    let html = `
        <div id='survey-submissions-list'>
            <h2>Survey Submissions</h2>
    `
    
    // Generate HTML for each submission using .map()
    const submissionsHTML = submissions.map(
        (submission) => {
            return `
                <section class="survey-submission-container">
                    <h2>Submission ${submission.id}</h2>
                    <p>Owns Blue Jeans: ${submission.ownsBlueJeans}</p>
                    <p>Location: ${submission.socioLocation.label}</p>
                </section>
            `
        }
    )

    // Join the array of strings into a single string and add to our HTML
    html += submissionsHTML.join("")
    
    html += `
        </div>
    `
    
    return html
}
```

The key changes we made:
1. Updated the fetch URL to include `?_expand=socioLocation`
2. Changed how we access the location data to use `submission.socioLocation.label` instead of `submission.socioLocationId`

Now, instead of showing just the location ID, we'll display the human-readable location label (e.g., "Urban" instead of "1").

## Refactoring LocationChoices with .map()

Now that we've learned how to use `.map()`, let's refactor our `LocationChoices` component to use it instead of a `for...of` loop. This is great practice and will make our code more concise.

Update your `LocationChoices.js` file:

```javascript
import { setSocioLocationId } from "./transientState.js"

const handleLocationChange = (changeEvent) => {
    if (changeEvent.target.name === "location") {
        const locationId = parseInt(changeEvent.target.value)
        setSocioLocationId(locationId)
    }
}

export const LocationChoices = async () => {
    const response = await fetch("http://localhost:8088/socioLocations")
    const locations = await response.json()

    document.addEventListener("change", handleLocationChange)

    let html = `
        <div class='survey-input' id='location-choice'>
            <h2>What type of area do you live in?</h2>
    `
    
    // Generate radio buttons using .map() instead of for...of
    const radioButtons = locations.map(
        (location) => `<input type="radio" name="location" value="${location.id}" /> ${location.label}`
    )
    
    html += radioButtons.join("")
    
    html += `
        </div>
    `
    
    return html
}
```

Let's break down the changes:
1. We replaced the `for...of` loop with a `.map()` call
2. For each location, we return the HTML string for a radio button
3. We join the array of strings and add it to our HTML

Notice how this version is more concise. We don't need a separate return statement inside the function we pass to `.map()` because we're using an arrow function with an implicit return (no curly braces).

## 📓 Key Concepts to Remember

1. **The .map() Method**: Transforms each element in an array and returns a new array of the same length.

2. **Array to String Conversion**: Use `.join("")` to convert an array of strings into a single string.

3. **Related Data**: Foreign keys like `socioLocationId` connect data between tables.

4. **JSON Server _expand**: The `_expand` query parameter allows you to include related data in your API responses.

5. **Arrow Function Syntax**: You can use the shorthand arrow function syntax `(param) => expression` for simple transformations.

## 🎓 Practice Exercise: Enhancing the Submission Display

Dr. Jones would like to make the submissions more informative. Your task:

1. Modify the `SubmissionList` component to:
   - Display each submission in a more structured format
   - Add a visual indicator for submissions where `ownsBlueJeans` is true
   - Sort the submissions by ID in descending order (newest first)

For sorting, look up the `.sort()` method on MDN and experiment with it.

## 📝 What We've Learned

In this chapter, we've:
- Created a component to display submissions from our database
- Learned about the powerful `.map()` method for transforming arrays
- Used the `.join("")` method to convert arrays to strings
- Explored related data using JSON Server's `_expand` query parameter
- Refactored existing code to use more modern array methods

## 🔜 Next Steps

Now that we can display submissions, our next step is to add an event listener that refreshes the submission list automatically whenever a new submission is created. This will involve using custom events to communicate between different parts of our application.

To explore the `.map()` method further, check out the [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) and try experimenting with it in the browser console.