# Customer List for Employees

For this chapter, you need to follow the same process as the last one so the **only employees** can view a list of all customers.

1. Create a navigation bar link titled "Customers".
1. Create a **`Customer`** module that contains a component function that accepts a single customer object as a prop. It should display the customer name, address, and phone number.
1. Create a **`CustomerList`** module that contains a component function that fetches all customers and iterates the array in the JSX to display the name of each customer by passing each object to the **`Customer`** component as a prop.
1. Create a **`CustomerDetails`** component that should display the full name, email, phone number, and address of the customer when the customer's name is clicked in the list view.
