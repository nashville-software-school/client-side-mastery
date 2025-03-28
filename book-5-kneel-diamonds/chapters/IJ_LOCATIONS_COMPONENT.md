# Building the Location Choices Component

In the previous chapter, we created our first component with static radio buttons for the jeans ownership question. Now, we'll take our application to the next level by creating a component that dynamically builds radio buttons based on data from our API.

This is a key concept in modern web development: instead of hardcoding options in our HTML, we'll fetch the available choices from our database and generate the HTML programmatically. This approach makes our application more flexible and easier to maintain.

> ⚠️ **REMEMBER:** Simply copying and pasting the provided code snippets is not recommended as it does not produce understanding or retention. We encourage you to type out the code, or at the very least read the code line by line. This way you think about what the code snippet actually does as you add it to your project.

## Creating the LocationChoices Component

Let's create a new component for asking users about the type of area they live in:

1. Create a new file called `LocationChoices.js` in your `scripts` directory
2. Let's add the basic structure for our component:

```javascript
export const LocationChoices = () => {
   // TODO: Fetch locations from the API
    
    let html = `
        <div class="survey-input" id="location-choice">
            <h2>What type of area do you live in?</h2>
            <!-- TODO: generate radio buttons here -->
        </div>
    `
    
    return html
}
``` 

> 💡 **FUN TIP:** 
>  |             |  | 
> :-------------------------|:-------------------------:
>  TODO Highlight is a fun vscode extension that automatically highlights the word, `TODO:` in your editor.  | <img src="./images/todo-highlight.png" width="300"> 

## Fetching Data from the JSON Server API

Now, let's add the code to fetch the location choices from our API:

```javascript
export const LocationChoices = async () => {
  const response = await fetch("http://localhost:8088/socioLocations")
  const locations = await response.json()

  let html = `
      <div class="survey-input" id="location-choice">
          <h2>What type of area do you live in?</h2>
          <!-- TODO: generate radio buttons here -->
      </div>
  `

  return html
}
```

Notice that we've marked our function as `async`. This is because we'll be using `fetch()` to get data from our API, which is an asynchronous operation.

In this code, we:
1. Make a GET request to our JSON Server API endpoint for socioLocations
2. Wait for the response and convert it to a JavaScript object using `.json()`
3. Store the locations in a variable that we'll use to generate our radio buttons

## Examining Network Requests with the Network Tab

Let's pause and examine what happens behind the scenes when we make this fetch request. The browser's Network tab is an invaluable tool for seeing HTTP requests and responses.

To view your request:
1. Open your browser's developer tools (F12 or right-click and select "Inspect")
2. Click on the "Network" tab
3. Refresh the page to see the requests

When the `LocationChoices` component runs, you'll see a request to `socioLocations` in the Network tab. Clicking on this request reveals:

- **Headers**: Contains information about the request, including:
  - URL: http://localhost:8088/socioLocations
  - Method: GET
  - Status Code: 200 OK (indicating success)

- **Preview/Response**: Shows the actual data returned from the server, which should be an array of location objects like:
  ```json
  [
    {
      "id": 1,
      "label": "Urban"
    },
    {
      "id": 2,
      "label": "Suburban"
    },
    ...
  ]
  ```

![Network Tab Request](./images/location-request-network.png)

This visual inspection helps you understand:
- If your request was successful
- What data you received
- How it's structured (which helps when you need to access specific properties)

## Generating Radio Buttons Dynamically

Now that we have our locations data, let's generate a radio button for each location option:

```javascript
export const LocationChoices = async () => {
    // Fetch locations from the API
    const response = await fetch("http://localhost:8088/socioLocations")
    const locations = await response.json()
    
    let html = `
        <div class="survey-input" id="location-choice">
            <h2>What type of area do you live in?</h2>
    `
    
    // Generate a radio button for each location
    for (const location of locations) {
        html += `<input type="radio" name="location" value="${location.id}" /> ${location.label}`
    }
    
    html += `
        </div>
    `
    
    return html
}
```

In this code, we:
1. Use a `for...of` loop to iterate through each location in our array
2. For each location, we generate an HTML string for a radio button:
   - The `name` attribute is set to "location" for all buttons (making them work as a group)
   - The `value` attribute is set to the location's ID (which we'll use later to store the user's choice)
   - After the radio button, we display the location's label

## Updating the Main Module

Now, let's update our `main.js` file to include our new component:

```javascript
import { JeanChoices } from "./JeanChoices.js"
import { LocationChoices } from "./LocationChoices.js"

const container = document.querySelector("#container")

const render = async () => {
    const jeansHTML = JeanChoices()
    const locationsHTML = await LocationChoices()
    
    container.innerHTML = `
        ${jeansHTML}
        ${locationsHTML}
    `
}

render()
```

Note the important changes:
1. We import the new `LocationChoices` component
2. We make the `render` function `async` since it calls an async function
3. We use `await` when calling `LocationChoices()` since it returns a Promise
4. We add the `locationsHTML` to our container

## The System at Work

Let's visualize what's happening in our application with a system diagram:

![System Diagram](./images/system-diagram-location-choices.png)

1. The browser loads `main.js`, which calls `render()`
2. `render()` calls `LocationChoices()`
3. `LocationChoices()` makes a GET request to the JSON Server API
4. The API returns the location data
5. `LocationChoices()` generates HTML with the data and returns it
6. `render()` combines the HTML from all components and updates the DOM
7. The user sees the rendered HTML in the browser

## Testing Our Component

Let's test our work:

1. Make sure your JSON server is still running (if not, start it with `json-server -p 8088 -w api/database.json`)
2. Open your browser to the local server URL (usually http://localhost:3000)

You should now see:
- The "Do you own a pair of blue jeans?" question with Yes/No options
- A new question "What type of area do you live in?" with four radio button options: Urban, Suburban, Semi-Rural, and Rural

![Location Choices Component](./images/indiana-jeans-locations-component.png)

## 📓 Key Concepts to Remember

1. **Async/Await**: When functions make API calls, they should be marked as `async` and use `await` for asynchronous operations
2. **Fetch API**: Used to make HTTP requests to your backend API
3. **Dynamic HTML Generation**: Using JavaScript to create HTML based on data from an API
4. **Network Tab**: A developer tool that allows you to inspect HTTP requests and responses
5. **Radio Button Groups**: Radio buttons with the same `name` attribute work as a group where only one can be selected

## 🎓 Practice Exercise: Inspecting Network Requests

1. Open your browser's developer tools and go to the Network tab
2. Refresh the page and find the request to `socioLocations`
3. Click on the request and examine:
   - The Headers tab: What's the request method, URL, and status code?
   - The Preview tab: How many location objects are returned?
4. Try adding a new location to your `database.json` file (in the `socioLocations` array)
5. Refresh the page and see if your new location appears in the radio buttons

## 📝 What We've Learned

In this chapter, we've:
- Created a new component that fetches data from our API
- Used the `async/await` syntax for handling asynchronous API calls
- Generated HTML dynamically based on data from the database
- Used the browser's Network tab to inspect HTTP requests and responses
- Updated our main render function to include multiple components

## 🔜 Next Steps

Our radio buttons now appear correctly but they don't actually capture the user's choices yet. In the next chapter, we'll learn about "transient state" - a way to temporarily store user selections before saving them to the database. We'll add event listeners to our radio buttons to capture the user's choices and store them in this transient state.
