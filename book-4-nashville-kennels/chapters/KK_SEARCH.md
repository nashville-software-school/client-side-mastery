# Searching for Candy

For this feature, you must provide a new component that allows a customer search for a specific product. Two components will share state, so you are going to implement the necessary state variable in their common ancenstor.

1. Create a **`InventorySearch`** component that has a prompt and an input field where the customer can type in a search term.
1. Add a new state variable to your candy provider component to track the customer's search terms.
1. Update your inventory list component to react to the user typing in something in the search field.
1. Update your **`ApplicationViews`** component to render both the search component and the list component when the customer is viewing the list of inventory.
