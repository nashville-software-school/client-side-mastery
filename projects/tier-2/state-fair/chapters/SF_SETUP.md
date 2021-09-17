# State Fair Events

## Setup

Open a new terminal window, copy pasta the following command into the terminal and hit enter to run it. It will create a basic file structure for you and create some starter code in the `~/workspace/statefair` directory.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/projects/tier-2/state-fair/chapters/scripts/statefair-install.sh)"
```

Then run the following command in your terminal to change directory to the project directory.

```sh
cd ~/workspace/statefair
```

Open the directory in Visual Studio Code. Then start the web server and follow the instruction in this project's chapters.

## End Goal

If you complete all of the chapters in this project, this is what your application will be able to do.

![animation showing ticket count after button click](./images/ticket-count.gif)

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

2. Then, to broadcast the event so that other components can listen for it, it must be dispatched to an HTML element. In this project, the `<main class="state-fair">` element is used.

    ```js
    eventHub.dispatchEvent(flowerSelectedEvent)
    ```

3. Other components can choose to listen, or react, to that event.

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
    eventHub.addEventListener()
    ```

1. In the body of the event listener callback function, check if the user clicked on the Ride Ticket button.
1. If so, create a custom event that describes what happened. For example:

    ```js
    const rideEvent = new CustomEvent("rideTicketPurchased")
    ```

1. Dispatch that event to the event hub.
1. Import and invoke the **`TicketBooth`** component function in `main.js`.
