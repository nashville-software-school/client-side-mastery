# Capturing User Choices with Transient State

## Introduction to State Management

In the previous chapters, we created components with radio buttons for our survey, but they don't actually capture the user's choices yet. When a user clicks a radio button, we need to store that selection somewhere before eventually saving it to our database.

This is where the concept of **state** comes into play. In web applications, we have two main types of state:

1. **Permanent State**: Data stored in a database that persists between user sessions
2. **Transient State**: Temporary data stored in memory while the user interacts with the application

## Understanding Transient State

Transient state is like a shopping cart before checkout. As users make selections, we collect their choices in memory. When they're ready to submit, we take all those choices and save them to the database (permanent state).

For our Indiana Jeans survey, we need to capture:
- Whether the user owns blue jeans (boolean)
- What type of area they live in (socioLocationId)

Let's build a module to manage this transient state.

## Creating the Transient State Module

First, let's create a new file called `transientState.js` in your `scripts` directory. 

Remember our overall goal: we're building a survey application that collects data for Dr. Jones' research on blue jeans. Looking back at our ERD, we need to create `submissions` objects that match the structure of our `submissions` table:

```json
{
  "ownsBlueJeans": boolean,
  "socioLocationId": number
}
```

The transient state object we're about to create will temporarily hold these same properties as the user makes selections, and eventually this data will be sent to our database as a new submission.

This module will:
1. Store the user's current choices in a structure that mirrors our submissions table
2. Provide functions to update those choices
3. (Later) Provide a function to save all choices to the database

```javascript
// Set up the transient state data structure and provide initial values
const transientState = {
    ownsBlueJeans: false,
    socioLocationId: 0
}

// Functions to modify each property of transient state
export const setOwnsBlueJeans = (chosenOwnership) => {
    transientState.ownsBlueJeans = chosenOwnership
}

export const setSocioLocationId = (chosenLocation) => {
    transientState.socioLocationId = chosenLocation
}
```

Let's break down this code:

1. We create a `transientState` object with the same properties as our submissions table and set some default values:
   - `ownsBlueJeans` initialized to `false` 
   - `socioLocationId` initialized to `0` (an invalid ID, indicating no selection)

2. We define two "setter" functions:
   - `setOwnsBlueJeans()`: Updates the jeans ownership status
   - `setSocioLocationId()`: Updates the selected location ID

3. Each function logs the updated state to the console so we can verify it's working

Notice that we don't export the `transientState` object directly. This is intentional - we're using the module pattern to keep the state object private and only expose functions to modify it in controlled ways.

## Updating the JeanChoices Component

Now let's update our `JeanChoices.js` file to capture user selections:

1. Import the setter function from the transient state module
2. Add an event listener to detect when radio buttons are clicked
3. Update the transient state when a selection changes

Open your `JeanChoices.js` file and modify it to match the following:

```javascript
import { setOwnsBlueJeans } from "./transientState.js"

const handleOwnershipChange = (changeEvent) => {
    if (changeEvent.target.name === "ownsJeans") {
        const convertedToBoolean = JSON.parse(changeEvent.target.value)
        setOwnsBlueJeans(convertedToBoolean)
    }
}

export const JeanChoices = () => {
    document.addEventListener("change", handleOwnershipChange)

    let html = `
        <div class='survey-input' id='jeans-choice'>
            <h2>Do you own a pair of blue jeans?</h2>
            <input type='radio' name='ownsJeans' value='true' /> Yes
            <input type='radio' name='ownsJeans' value='false' /> No
        </div>
    `

    return html
}
```

Let's analyze what we've added:

1. We import the `setOwnsBlueJeans` function from our transient state module
   
2. We create a new function `handleOwnershipChange` that:
   - Checks if the changed element is a radio button with name "ownsJeans"
   - Converts the string value ("true" or "false") to an actual boolean using `JSON.parse()`
   - Calls our setter function with the boolean value
   
3. We add an event listener to the entire document that listens for "change" events and calls our handler function

The event listener is attached to the document because our component's HTML hasn't been added to the DOM yet when the function runs. This approach ensures the event will be captured regardless of when the elements are added to the page.

## Updating the LocationChoices Component

Similarly, let's update our `LocationChoices.js` file to capture location selections:

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
    
    for (const location of locations) {
        html += `<input type="radio" name="location" value="${location.id}" /> ${location.label}`
    }
    
    html += `
        </div>
    `
    
    return html
}
```

The process is similar to what we did with the JeanChoices component:

1. We import the `setSocioLocationId` function
2. We create a `handleLocationChange` function that:
   - Checks if the changed element is a radio button with name "location"
   - Converts the string value to a number using `parseInt()`
   - Calls our setter function with the numeric ID
3. We add an event listener to the document

Note that we convert the value to a number with `parseInt()` because we need a numeric ID to match our database structure.

## Testing Transient State

To see your transient state in action:

1. Make sure both your JSON server and web server are running
2. Open your application in the browser
3. Open the browser's developer tools (F12 or right-click → Inspect)
4. Navigate to the Console tab
5. Click on different radio button options

You should see the transient state object logged to the console each time you make a selection, with the updated values:

When you select "Yes" for jeans ownership:
```
{ownsBlueJeans: true, socioLocationId: 0}
```

When you select "Suburban" for location:
```
{ownsBlueJeans: true, socioLocationId: 2}
```

## Visualizing the System

Let's visualize how the components and transient state work together:

```
┌─────────────────┐         ┌───────────────────┐
│                 │         │                   │
│  JeanChoices    │         │  LocationChoices  │
│  Component      │         │  Component        │
│                 │         │                   │
└────────┬────────┘         └────────┬──────────┘
         │                           │
         │ setOwnsBlueJeans          │ setSocioLocationId
         │                           │
         ▼                           ▼
┌─────────────────────────────────────────────┐
│                                             │
│              Transient State                │
│                                             │
│      {                                      │
│        ownsBlueJeans: true|false,           │
│        socioLocationId: number              │
│      }                                      │
│                                             │
└─────────────────────────────────────────────┘
```

This diagram shows how:
1. The `JeanChoices` component updates the `ownsBlueJeans` property via the `setOwnsBlueJeans` function
2. The `LocationChoices` component updates the `socioLocationId` property via the `setSocioLocationId` function
3. Both components work with the same transient state object

## 📓 Key Concepts to Remember

1. **Transient State vs. Permanent State**: Transient state is temporary data stored in memory during user interaction. Permanent state is data stored in a database that persists between sessions.

2. **Module Pattern**: We keep the state object private and only expose functions to modify it in controlled ways.

3. **Event Delegation**: By attaching event listeners to the document, we can capture events from elements that might not exist yet.

4. **Type Conversion**: We need to convert string values from inputs to appropriate data types (boolean, number) before storing them.

5. **Unidirectional Data Flow**: Data flows one way - from user inputs through event handlers to our transient state.

## 🎓 Practice Exercise: Blue Jeans Cost

Dr. Jones is excited about your progress! She would like to add a new question to the survey:

"Approximately how much did your blue jeans cost?"

Your task:
1. Update the transient state object to include a new property `blueJeansCost` with an initial value of 0
2. Create a new setter function `setBlueJeansCost` in the transient state module
3. Create a new component called `JeansCost.js` that:
   - Displays the cost question
   - Provides a number input field
   - Includes an event handler to update the transient state
4. Add your new component to the main render function

Hint: For a number input, use `<input type="number" name="jeansCost" />` and remember to convert the value to a number before storing it.

## 📝 What We've Learned

In this chapter, we've:
- Created a module to manage transient state
- Implemented setter functions to update state
- Added event handlers to our components
- Connected radio button selections to state updates
- Used the console to verify our code is working
- Established a pattern for capturing and storing user input

## 🔜 Next Steps

Now that we can capture user choices, our next step is to create a submission button and a function to save the transient state to our database (permanent state). We'll also display the list of existing submissions on the page.