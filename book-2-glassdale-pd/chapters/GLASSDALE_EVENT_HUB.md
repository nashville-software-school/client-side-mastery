# Filtering Criminals by Crime

In this chapter, you are going to implement the idea of the Event Hub from the last chapter and get your components talking to each other with messages.

```js
/*
    Which element in your HTML contains all components?
    That's your Event Hub. Get a reference to it here.
*/
const eventHub =

const ConvictionSelect = () => {
    const convictions = useConvictions()

    /*
        On the Event Hub, listen for a "change" event. Remember to write
        an `if` condition to make sure that it was the `#crimeSelect`
        element that changed.

        When that event happens, dispatch a custom message to your Event
        Hub so that the criminal list can listen for it and change what
        it renders.
    */
    eventHub.addEventListener()

    const render = convictionsCollection => {
        contentTarget.innerHTML = `
            <select class="dropdown" id="crimeSelect">
                <option value="0">Please select a crime...</option>
                ... you wrote awesome code here ...
            </select>
        `
    }

    render(convictions)
}
```