# Editing Entries

Let's add functionality to edit journal entries. You can more or less replicate the (steps you followed in Glassdale)['./GLASSDALE_EDIT_NOTES.md'].

As a refresher, here are the steps you'll need to follow:

1. Add an Edit button to your journal entry component
2. Add an event listener to that edit button. When clicked, the button should render an Edit form
3. The edit form should pre-populate its fields with the correct journal entry's data
4. When the user clicks the edit button, you should collect the updated info from the form and send it to your json-server with a `PUT` request