# Editing Entries

1. Add edit button to journal entry
1. Add hidden input field to form to store `id` value of edited entry
1. Add event listener to button. Give unique id which includes `id` property of entry
1. When clicked, get the individual entry and populate the form fields with text content.
1. When user clicks the save button, determine if editing or creating (does hidden input field have a value?)
1. If editing, perform a PUT request to the API
1. Get all entries and display again