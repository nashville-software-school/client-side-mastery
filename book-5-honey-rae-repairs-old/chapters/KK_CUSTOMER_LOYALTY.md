# Lost Loyalty

### As an employee, I need to update the loyalty ID of a customer if she lost her card.

---

**Given** a customer needs a new loyalty ID number

**When** an employee views a list of all customers

**Then** the customer name should be a hyperlink that can be clicked on

---

**Given** an employee is viewing a list of customers

**When** the employee clicks on a customer name

**Then** a form should appear with a text input field showing the customer's current loyalty ID and a button labeled "Update"

---

**Given** an employee has changed the value of a customer's loyalty ID in the edit form

**When** the employee clicks the "Update" button

**Then** the new loyalty ID should be saved to the API