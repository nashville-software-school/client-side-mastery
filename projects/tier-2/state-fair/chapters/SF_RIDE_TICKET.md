# A Ticket to Ride

When a person clicks on the button to purchase a ride ticket, you will display a colored box representing that person beneath the title.

![animation of ride tickets elements being generated](./images/ride-tickets.gif)

In the `main.css` file, you will see several classes available for your use. For people who purchase ride tickets, you will use the classes of `.person` **and** `.rider` to style the box you put in the **Rides** column.

## Listen for Custom Event

1. Open the **`RideTicketHolder`** component file.
1. Add an event listener to the event hub that listens for the custom event that you dispatched from the **`TicketBooth`** component.
1. In the body of the event listener callback function, add a new `<div>` element to the content target that has the correct classes on it (_see above_).