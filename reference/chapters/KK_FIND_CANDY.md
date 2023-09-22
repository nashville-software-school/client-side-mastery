# Finding Candy

#### As a customer, I want to see if Kandy Korner sells my favorite candy.

---
**Given** a customer wants to find a specific candy

**When** a customer clicks on a "Find Candy" navigation link

**Then** the customer should be presented with a view that displays a text input field, with a label of "What candy are you looking for?"

---
**Given** a customer is trying to find a candy

**When** the customer types in a product name in the search input field

**Then** any products whose name starts with the customer's search terms should be displayed

**And** only the product name and price should be displayed. Product type should not be displayed.

---

## Optional Stretch Goal

**Given** the customer has entered in a search term in the product search input field

**When** any product name that starts with the search term matches

**Then** any products whose name starts with the customer's saerch terms should be displayed

**And** a link labeled "Show me where" should appear next to the product name

---
**Given** a customer is viewing a list of matching products

**When** the user clicks the "Show me where" link

**Then** an alert box should appear listing the addresses of the stores that sell the product



