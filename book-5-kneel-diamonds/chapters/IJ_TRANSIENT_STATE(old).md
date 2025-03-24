# Tracking Transient State

There are two kinds of state to track when you are developing an application. Transient state and permanent state.

## Transient State

When your customer is interacting with input fields in your user interface - text fields, dropdowns, radio buttons, text buttons, etc. - you need to store their current choice in temporary, or transient state. This kind of state changes every time they type a character into a field, or make a choice on a group of radio buttons.

## Permanent State

The moment the user clicks a **Save** or **Send** or **Order** button, it is the signal that choices are done being made and it is time to make their current transient state into permanent state. All of the choices are saved in a database. In your case, you will send their transient state to be stored in the `database.json` file in the API running on your machine.

Think of permanent state as completed, and unchanging.

## Transient State Tracker

1. Create a new file in your `scripts` directory named **TransientState.js**.
2. Put the following comments in it.
    ```js
    // Set up the transient state data structure and provide initial valuess



    // Functions to modify each property of transient state



    // Function to convert transient state to permanent state
    ```
3. Then watch the following video that implements the initial state and the functions to modify each transient state property. Then you update your code to match.

[<img src="../../book-1-installations/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/TK5rRPQzsC8EBCRbBLQX)


## Updating Transient State

Now you have two files, each of which tracks a particular kind of state.

1. **TransientState.js** tracks choices as the user interacts with your application.
2. **database.json** will store their choices permanently when they click **Submit** on the survey _(which isn't implemented yet)_.

Time to start tracking choices. The first one you will implement is tracking if the user chooses **Yes** or **No** for owning a pair of blue jeans. You will be adding a _change_ event listener since the user will be changing the value of the radio button group between `true` and `false`.

Open the jeans ownership question module and add the following code in. It can be added above the component module, or below it. Whichever is more readable to you.

This is the function that _will be executed_ when the user changes which radio button is selected. Thus, a change event will be broadcast by the browser.


```js
 /*
     Since the value of the radio buttons is the string of
     'true' and the string of 'false', you must convert the
     string to an actual boolean with JSON.parse() as seen below
 */
const handleOwnershipChange = (changeEvent) => {
    if (changeEvent.target.name === "ownsJeans") {
        const convertedToBoolean = JSON.parse(changeEvent.target.value)
        setOwnsBlueJeans(convertedToBoolean)
    }
}
```


Now you can update your component function with an event listener so that the function is invoked when the change event is broadcast.

```js
export const OwnJeansChoices = () => {

    document.addEventListener("change", handleOwnershipChange)

    let choicesHTML = "<h1>Do you own jeans?</h1>"
    choicesHTML += "<input type='radio' name='owns' value=true /> Yes"
    choicesHTML += "<input type='radio' name='owns' value=false /> No"

    return choicesHTML
}
```

## Watching State Change

Watch the following, quick video to see the final step to hook everything up and add some `console.log()` statements to watch your transient state change when you select the radio buttons.

[<img src="../../book-1-installations/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/6Jv5vZ7popGeOUnrZcOj)

## Saving Location Question State

The next step is to save the choice that the user makes for the second question about the type of area lived in. We encourage you to try implementing the code yourself first - the process is nearly identical. Note that you will have to use `parseInt()` to convert the value of the choice instead of `JSON.parse()` since the value of each radio button is an integer instead of a boolean.

If you get stuck on the implementation, you can watch the video below to see how it is done.

[<img src="../../book-1-installations/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/2U2PbksARfJ37MED5pHB)



