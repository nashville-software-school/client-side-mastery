# Saving Survey Submissions

## Introduction to Permanent State

In the previous chapter, we created our transient state module and updated our components to capture user choices. Now, we're ready to take the final step: saving the user's selections to our database, transforming transient state into permanent state.

To accomplish this, we'll need to:

1. Create a submission button component
2. Add functionality to submit transient state to permanent state
3. Create an event listener to trigger the submission process

## Creating the Submission Button Component

Let's start by creating a button that users can click to submit their survey responses.

Create a new file called `SubmissionButton.js` in your `scripts` directory:

```javascript
import { saveSurveySubmission } from "./transientState.js"

const handleSurveySubmission = (clickEvent) => {
    if (clickEvent.target.id === "submission-button") {
        saveSurveySubmission()
    }
}

export const SubmissionButton = () => {
    document.addEventListener("click", handleSurveySubmission)

    return `<button id='submission-button'>Save Submission</button>`
}
```

Let's break down what this component does:

1. We import the `saveSurveySubmission` function (which we'll create next)
2. We define a `handleSurveySubmission` function that:
   - Checks if the clicked element has the ID "submission-button"
   - If so, calls our `saveSurveySubmission` function
3. We create and export the `SubmissionButton` component that:
   - Adds an event listener for click events
   - Returns HTML for a button with the ID "submission-button"

## Adding the Button to Main.js

Now, let's update our `main.js` file to include the submission button:

```javascript
import { JeanChoices } from "./JeanChoices.js"
import { LocationChoices } from "./LocationChoices.js"
import { SubmissionButton } from "./SubmissionButton.js"

const container = document.querySelector("#container")

const render = async () => {
    const jeansHTML = JeanChoices()
    const locationsHTML = await LocationChoices()
    const buttonHTML = SubmissionButton()
    
    container.innerHTML = `
        ${jeansHTML}
        ${locationsHTML}
        ${buttonHTML}
    `
}

render()
```

We've added:
1. An import for the `SubmissionButton` component
2. A call to the `SubmissionButton()` function to get the button HTML
3. The button HTML in our container's content

## Updating the Transient State Module

Now, let's add the `saveSurveySubmission` function to our `transientState.js` file:

```javascript
// Set up the transient state data structure and provide initial values
const transientState = {
    ownsBlueJeans: false,
    socioLocationId: 0
}

// Functions to modify each property of transient state
export const setOwnsBlueJeans = (chosenOwnership) => {
    transientState.ownsBlueJeans = chosenOwnership
    console.log(transientState)
}

export const setSocioLocationId = (chosenLocation) => {
    transientState.socioLocationId = chosenLocation
    console.log(transientState)
}

// Function to convert transient state to permanent state
export const saveSurveySubmission = async () => {
    const postOptions = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(transientState)
    }

    const response = await fetch("http://localhost:8088/submissions", postOptions)

    const customEvent = new CustomEvent("submissionCreated")
    document.dispatchEvent(customEvent)
}
```

We've added the `saveSurveySubmission` function that:

1. Creates a configuration object (`postOptions`) for our fetch request with:
   - The HTTP method set to "POST"
   - A header specifying we're sending JSON data
   - The body containing our transient state converted to a JSON string
   
2. Makes a POST request to our submissions endpoint with these options
   
3. Dispatches a custom event to notify other parts of our application that a submission has been created

## Understanding the POST Request

When we call `saveSurveySubmission`, we're making a POST request to our JSON Server API. Let's look at what's happening behind the scenes:

1. **Request URL**: `http://localhost:8088/submissions`
2. **Request Method**: POST
3. **Request Headers**: 
   - `Content-Type: application/json`
4. **Request Body** (Payload):
   ```json
   {
     "ownsBlueJeans": true,
     "socioLocationId": 2
   }
   ```

When the server receives this request, it:
1. Adds an `id` property with a unique value
2. Adds the new object to the submissions array in our database
3. Returns the newly created object with its assigned ID
4. Sends a `201 Created` status code to indicate success

## Visualizing the Submission Process

Let's visualize the entire process from the user clicking the button to the data being saved in the database:

```
┌────────────────┐      ┌───────────────────┐      ┌───────────────┐      ┌─────────────────┐
│                │      │                   │      │               │      │                 │
│  User clicks   │      │ handleSurvey      │      │ saveSurvey    │      │ JSON Server API │
│  submit button │─────▶│ Submission()      │─────▶│ Submission()  │─────▶│                 │
│                │      │                   │      │               │      │                 │
└────────────────┘      └───────────────────┘      └───────────────┘      └────────┬────────┘
                                                                                    │
                                                                                    │ Save data
                                                                                    ▼
                                                                          ┌─────────────────┐
                                                                          │                 │
                                                                          │  database.json  │
                                                                          │                 │
                                                                          └─────────────────┘
```

This sequence shows how:
1. The user clicks the submission button
2. The click event triggers `handleSurveySubmission()`
3. This function calls `saveSurveySubmission()`
4. `saveSurveySubmission()` makes a POST request to the JSON Server API
5. The API saves the data to our database.json file

## Testing the Submission Process

To test your submission process:

1. Make sure both your JSON server and web server are running
2. Open your application in the browser
3. Select options for jeans ownership and location
4. Click the "Save Submission" button
5. Open your browser's developer tools (F12 or right-click → Inspect)
6. Navigate to the Network tab
7. Look for the POST request to "submissions"

Clicking on this request reveals detailed information:

- **Headers tab**: Shows request URL, method (POST), status code (201 Created)
- **Payload tab**: Shows the data that was sent (your transient state)
- **Preview/Response tab**: Shows the server's response, including the new ID

You can also verify the submission was saved by:
1. Making a GET request to `http://localhost:8088/submissions` in Yaak
2. Looking at your database.json file, which should now include the new submission

## Examining Network Requests

Let's take a closer look at what's happening in the Network tab when you submit the form:

### Request Headers
- **URL**: `http://localhost:8088/submissions`
- **Method**: POST
- **Status Code**: 201 Created
- **Content-Type**: application/json

### Request Payload
This is the data you sent to the server:
```json
{
  "ownsBlueJeans": true,
  "socioLocationId": 2
}
```

### Response
This is what the server sent back:
```json
{
  "ownsBlueJeans": true,
  "socioLocationId": 2,
  "id": 2
}
```

Notice that the server added an `id` property to your data. This unique identifier allows you to reference this specific submission later.

## 📓 Key Concepts to Remember

1. **Converting Transient to Permanent State**: When we save form data to a database, we're converting transient state (temporary, in-memory data) to permanent state (persisted data).

2. **POST Request Configuration**: A POST request requires:
   - The correct URL endpoint
   - The HTTP method set to "POST"
   - A Content-Type header (usually "application/json")
   - A body containing the data to be created

3. **JSON.stringify()**: Converts JavaScript objects to JSON strings for sending to the server.

4. **Status Code 201**: Indicates that a resource was successfully created.

5. **Network Tab**: A developer tool that allows you to inspect HTTP requests and responses in detail.

6. **Custom Events**: Allow different parts of your application to communicate without being directly connected.

## 🎓 Practice Exercise: Complete or Incomplete?

Dr. Jones has asked for a new feature: she'd like to know if a survey submission is complete (has both jeans ownership and location data).

Your task:
1. Update the `saveSurveySubmission` function to check if both required fields have valid values:
   - `ownsBlueJeans` should be true or false (but not undefined or null)
   - `socioLocationId` should be a number greater than 0
2. If either check fails, alert the user that they need to complete the form
3. Only proceed with the POST request if both checks pass

Hint: You can use a simple if statement with an alert() for this exercise.

## 📝 What We've Learned

In this chapter, we've:
- Created a submission button component
- Added an event handler to capture button clicks
- Implemented the function to convert transient state to permanent state
- Made POST requests to save data to our JSON Server API
- Used the Network tab to inspect HTTP requests and responses
- Created and dispatched custom events

## 🔜 Next Steps

Now that we can save submissions to our database, the next step is to display the list of existing submissions on the page. We'll create a new component that fetches all submissions and displays them in a formatted list.