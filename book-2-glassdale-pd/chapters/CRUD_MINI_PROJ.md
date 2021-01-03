# Contact List

## Putting it all together
Your task is to build an application for a user to keep track of their friends' contact information. You can work with a team or work by yourself. 

## Requirements 
For this project you should use:
1. ES6 Modules with import/ export statements (_don't forget to draw your module map!_)
1. Single responsibility functions
1. Webpack for task automation
1. You can hard code your form to create contacts into your `index.html` file.

## Project specs
### Reading contacts

When the page loads, the user should see a list of all their contacts. All contacts should load from your `json-server` database.

### Saving contacts
When the page loads, the user should see a form to enter a new contact.
The a form with the following input fields:
1. Name
1. Phone number
1. Address

Users should be able to enter information into the form fields and click a button that says "Save". When they click the save button, the contact should be saved to the `json-server` database and should appear in the DOM.

### Deleting Contacts
Each individual contact card should have a delete button. When the user clicks the delete button, the contact should be deleted from the database and the DOM.

### Editing Contacts
Each individual contact card should have an edit button. When the user clicks the edit button, an edit form should appear with that contact's information pre-populated. When the user clicks a submit button for the edit form, the newly edited contact information should be sent to the database and refreshed in the DOM.

## Modules
You should plan on building the following modules. You can build other ones in addition to these if you want to.
#### `apiManager.js`
This module shoulld handle all interactions with the database
#### `contactList.js`
This module should build and return a component for a list of all contacts. It should import and render the component from `contactCard.js`.
#### `contactCard.js`
This module should build and return a component for a _single_ contact card. 
#### `editForm.js`
This module should build and return a component for an edit form. 
#### `main.js`
This module should contain your click events

### Challenges
1. A search bar where users can search contacts by name, phone number, or address




