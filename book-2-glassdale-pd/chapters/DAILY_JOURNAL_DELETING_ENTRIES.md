# Deleting Journal Entries

1. Add `Delete` button to each journal entry card that you display
1. Add a `click` event listener to delete button
1. When clicked, perform a DELETE request to your API.
1. Make sure that the data provider dispatches an event that its state has changed (e.g. `"journalStateChanged"`).
1. The entry list component should listen for that event and re-render itself with the new data.