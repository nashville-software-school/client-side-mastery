## A Growing Business

In this exercise, you are going to refactor you application to include office locations. Your business is thriving and now you have offices in Nashville, Atlanta, and Memphis. Each employee will be assigned to one office location.

### The Workforce ERD

Add a new table to your ERD in dbdiagram.io to visualize the locations resource and its relationship to the employees resource.

### HTML Representations

1. Add a new resource in your database named `locations` and create an object representation of each office location.
1. Modify each employee object to have a foreign key to one office location.
1. Refactor **`EmployeeList`** to display the office location in the employee's HTML representation.

The final HTML representation should look like this.

```html
<div class="employee">
    <header class="employee__name">
        <h1>Rainu Ittycheriah</h1>
    </header>
    <section class="employee__computer">
        Currently using a 2015 MacBook Pro
    </section>
    <section class="employee__department">
        Works in the IT department
    </section>
    <section class="employee__location">
        Works at the Memphis office
    </section>
</div>
```