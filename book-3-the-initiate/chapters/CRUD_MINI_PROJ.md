# Contact List

## Putting it all together
Your task is to build an application for a user to keep track of their friends' contact information. You can work with a team or work by yourself. 

## Project specs
### Saving Contacts

When the page loads, the user should see:

#### A list of all their contacts
All contacts should load from your `json-server` database on page load.

#### A form to enter a new contact
The a form with the following input fields:
1. Name
1. Phone number
1. Address
1. A dropdown menu labeled "contact type" with the following options:
    - Work
    - Family
    - Friends

Users should be able to enter information into the form fields and click a button that says "Save". When they click the save button, the contact should be saved to the `json-server` database.

### Deleting Contacts
Each individual contact card should have a delete button. When the user clicks the delete button, the contact should be deleted from the database and the DOM.

### Editing Contacts
Each individual contact card should have an edit button. When the user clicks the edit button, an edit form should appear with that contact's information pre-populated. When the user clicks a submit button for the edit form, the newly edited contact information should be sent to the database and refreshed in the DOM.

### Challenges
1. A search bar where users can search contacts by name, phone number, or address
1. A filter feature where users can see _only_ work contacts, _only_ family contacts, or _only_ friend contacts.





