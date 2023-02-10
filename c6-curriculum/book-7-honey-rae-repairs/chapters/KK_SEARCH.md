# Searching for Candy

For this feature, you must provide a new component that allows a customer search for a specific product. Two components will share state, so you are going to implement the necessary state variable in their common ancenstor.

Here's some hints.

1. Create an **`Inventory`** component. This will serve as the common ancenstor for two children.
1. Add a state variable to your **`Inventory`** component to track the customer's search terms.
1. Create a **`InventorySearch`** component that has a prompt and an input field where the customer can type in a search term.
1. Render both the search and list component as children of **`Inventory`**. You will need to pass one attribute to each. One of the components needs a reference to the state variable. One of the components needs access to the setter function for the state variable.
    ```jsx
    // Pseudo-code example
    return (
        <>
            <InventorySearch someAttribute={} />
            <InventoryList someAttribute={} />
        </>
    )
    ```
1. Update your **`ApplicationViews`** component to render the parent component when the customer is viewing the list of inventory.
    ```jsx
    // Pseudo-code example
    <Route path="/inventory">
        <Inventory />
    </Route>
    ```
1. Update your inventory list component to react to the user typing in something in the search field.
