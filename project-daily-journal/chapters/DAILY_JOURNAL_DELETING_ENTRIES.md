# Deleting Journal Entries

1. Add `Delete` button to each journal entry card that you display. Make sure that the primary key of the corresponding entry is in the `id` attribute of each button.
1. Add an event listener that listens for when the user clicks on any delete button.
1. Capture the `id` of the button that was clicked on.
1. When clicked, perform a DELETE request to your API.
1. Make sure that the function that performs the delete operation dispatches a custom event since the state of your data has changed.
1. Regenerate your application's HTML when the state changed event is handled by the main module.