# State Fair Events

In this project, you are going to practice using `CustomEvent` and `dispatchEvent()` and `addEventListener()` to let users buy tickets to certain attractions at the state fair and then send the person to that area of the park.

![](./images/ohiostatefair.jpg)

## Custom Events Review

Time to review the three main parts of working with custom events in a JavaScript application.

1. One component in your application can let other components know that the user did something, or that something changed by creating a custom event. For example, if the user selects a flower from a dropdown field, you can create the following custom event.
    ```js
    const flowerSelectedEvent = new CustomEvent("flowerSelected", {
        detail: {
            selectedFlower: "Daisy"
        }
    })
    ```
1. Then, to broadcast the event so that other components can listen for it, it must be dispatched to an HTML element. In this project, the `<main class="state-fair">` element is used.
    ```js
    eventHub.dispatchEvent(flowerSelectedEvent)
    ```
1. Other components can choose to listen, or react, to that event.
    ```js
    eventHub.addEventListener("flowerSelected", customEvent => {
        const userChoiceElement = document.querySelector(".flowerSelection")
        userChoiceElement.innerHTML = customEvent.detail.selectedFlower
    })
    ```

## Ticket Booth Component

1. In the `TicketBooth.js` component, add the following button as a child of the ticket booth `<div>`.
    ```html
    <button id="rideTicket">Ride Ticket</button>
    ```
1. Add a click event listener on the content target element reference. Some starter code below.
    ```js
    contentTarget.addEventListener()
    ```
1. In the body of the event listener callback function, check if the user clicked on the Ride Ticket button.
1. If so, create a custom event that describes what happened. For example:
    ```js
    const rideEvent = new CustomEvent("rideTicketPurchased")
    ```
1. Dispatch that event to the event hub.
1. Import and invoke the **`TicketBooth`** component function in `main.js`.