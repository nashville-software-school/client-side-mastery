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
    if (changeEvent.target.name === "ownJeans") {
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
   - Checks if the changed element is a radio button with name "ownJeans"
   - Converts the string value ("true" or "false") to an actual boolean using `JSON.parse()`
   - Calls our setter function with the boolean value
   
3. We add an event listener to the entire document that listens for "change" events and calls our handler function

## Testing the Code 

> ⚠️ You've just added substantial logic to your program - now it's time to test it thoroughly. But testing is only half the equation. You also need to fully understand what each part of the code does. 
>
> Never let any code in your program remain a mystery. If there's even a single line you're struggling to understand, make use of all available resources to clarify it:
>
> - Step through it with the debugger
> - Ask an AI assistant to explain the concept
> - Discuss it with teammates 
> - Reach out to your instructors
>
> Building this habit of ensuring understanding will save you countless hours of debugging in the future and make you a more effective developer. Remember: professional developers don't just write code that works - they write code they understand.

Place a breakpoint or a `debugger` statement on the first line of the `handleOwnershipChange` function. Refresh the browser and choose an option for "**Do you own a pair of blue jeans?"** Observe and/or confirm the following and make changes if needed. 

1. What is the value of `changeEvent.target.name`? Does the if statement pass? 
2. What is the value of `changeEvent.target.value`? What is the value after it is converted with `JSON.parse()`? Why is this necessary?
3. Step **into** the `setOwnsBlueJeans` function. What's the value of `chosenOwnership`? What is the value of `transientState`?
4. Step **over**. What is the value of `transientState` now? What has changed?
5. Choose a location option. Does the same code run? Why or why not? 

## Updating the LocationChoices Component

Time to capture the user's location choice! Try to implement this code on your own. Expand the hints below if you need some help. 

<details>
  <summary>💡 Algorithm</summary>

  As you might have guessed, the process is similar to what we did with the JeanChoices component:

   1. Import the `setSocioLocationId` function
   2. Create a `handleLocationChange` function that:
      - Check if the changed element is a radio button with name "location"
      - Convert the string value to a number using `parseInt()`
      - Call the setter function with the numeric ID
   3. Add an event listener to the document

   Note that we convert the value to a number with `parseInt()` because we need a numeric ID to match our database structure.

</details>

<details>
  <summary>💡 Code</summary>

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
</details>

## 📓 Key Concepts to Remember

1. **Transient State vs. Permanent State**: Transient state is temporary data stored in memory during user interaction. Permanent state is data stored in a database that persists between sessions.

2. **Module Pattern**: We keep the state object private and only expose functions to modify it in controlled ways.

3. **Type Conversion**: We need to convert string values from inputs to appropriate data types (boolean, number) before storing them.

## 📝 What We've Learned

In this chapter, we've:
- Created a module to manage transient state
- Implemented setter functions to update state
- Added event handlers to our components
- Connected radio button selections to state updates
- Used the console to verify our code is working
- Established a pattern for capturing and storing user input

## 🔜 Next Steps

Now that we can capture user choices, our next step is to create a submission button and a function to save the transient state to our database (permanent state). 