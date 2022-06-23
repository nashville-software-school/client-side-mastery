# Games and Arcade

Want to find out how strong you are? Then ring the bell at the top!

How is your hand-eye coordination? See how many ducks you can knock down with these baseballs.

Have good aim? Shoot those bandits with the air rifle.

Have a quick hand? Grab as many penguins as you can when they float by with this magnet.

Are video games your specialty? Drop by our arcade which has dozens of the most popular video games of all time. See if you can get the top score.

Let people purchase game tickets and record it in the **Games** column.

![animation showing game tickets being generated](./images/game-tickets.gif)

## Listen for Custom Event

1. Create a new button in the ticket booth for people to buy game tickets.
1. Create a **`GameTicketHolder`** component file, and add an event listener to the event hub that listens for the game ticket custom event that you will dispatch from the **`TicketBooth`** component.
1. In the body of the event listener callback function, add a new `<div>` element to the content target that has the correct classes on it (_see above_).
