<a id="challenge-1"></a>
# Challenge \#1 - Address Book

Use XHR to create a simple tabbed contact info collection.

## Requirements

+ The page displays a tab for each letter of the alphabet that is represented in the address book by last name or business name ( `"S"` would contain _Jane Smith_ and _The Smiling Elephant restaurant_ ) 
+ The app comes pre-loaded with info for places in Nashville, like restaurants, sights and other business that have paid you to list them in your app. The built-in addresses/info should be stored in a local JSON file.
+ The user can click a tab to see the listings under that letter, or they can type in a name, and the app displays the matching results. 
+ The user should also be able to store new contacts. The form inputs and submit btn(s) should change from `find contact` to `add contact` based on a radio button selection. 
+ When the user submits a contact, it should display below the form with two buttons: “Save” and “Edit”. If user clicks “save”, the contact should be saved to localStorage, and be available to the same search function that retrieves the built-in contacts.
+ If user clicks “Edit”, the form is re-populated with the contact info so the user can edit it.
+ The UI should use Bootstrap 

<a id="challenge-2"></a>

# Challenge \#2 - Building Tetris in a Canvas

As a team, use the HTML5 canvas tag to build a browser based version of the classic game, [Tetris](https://en.wikipedia.org/wiki/Tetris).

1. Randomly pick one of the seven shapes and place it at the top of the game area.
1. Allow user to use the arrow keys to move left, right, or down.
1. Allow user to rotate the piece with the `w`, and `r` keys.
1. Allow user to press spacebar to move the piece down into position quickly.
1. As soon as a row is filled, remove all blocks in the row.

