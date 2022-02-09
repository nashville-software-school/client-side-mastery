# Example Dev User Stories

Below is a few examples of tasks you may recieve as a developer.  Your job is to read the criteria and ask your instructors if you have any question on what needs to be done.  

Once you've figured out what the expected end result should be, design a plan to achieve that result.  After that, you make a new branch and code away!

Some of these will be easy and touch only a few files.  Others will be complex.

Note: The design of this feature may not be how you would do it.  When working on a real application, you may need to take on tasks that seem strange to you.  It's your job to ask questions and offer suggestions, but it's ultimately the businesses choice as to the functionality. Once user stories are created and started, changes should not happen.  

## Add an admited date

Nashville Kennels would like to start tracking the average stay of an animal.  The dev team has broken this work down into several User Stories to accomplish this.  Each story should be independently worked on, but some may need to be completed before you can start others.

### US001: Add an admitted date to the "New Animal" form

Acceptance Criteria:

- The "new animal" form needs to have a field of type date that should be labled "date admited"
- The date field should default to today's date
- When the form is saved, the admitance date should be saved in the database with the animal

### US002: Add an admitted date to the "Edit Animal" form

Acceptance Criteria:

- The "edit animal" form needs to have a field of type date that should be labled "date admited"
- The date field should display the date the animal was admited
- Users should NOT be able to edit this date.  

### US003: Add a date to when an animal was discharged

Acceptance Criteria:

- When an animal is discharged, instead of deleting the animal completely, add an `isDischarged` parameter to the animal model to mark it as discharged.
- The date discharged should be the date the button was clicked.  There is no need to create an extra field.
- When routing to `/animals` only animals that are still in Nashville Kennels care should be displayed


### US004: Display Discharged Animals

Acceptance Criteria:

- Create a route `/discharged` that lists all the discharged animals.
- Use the same styling schema as the rest of the app

### US005: Edit Admitted and Discharge Dates

Acceptance Criteria:

- In the route `/discharged` add a button to edit the admitted and discharge dates.
-When edited, dates should persist in the database

### US006: Sorting Discharged Animals

Acceptance Criteria:

- In the `/discharged` route, sort the animals by discharged date. Most recently discharged animals should be first.

### US007: Sort Admitted Animals

Acceptance Criteria:

- In the `/animals` route, sort the animals by admitted date. Most recently admitted animals should be last.

### US008: Search Admitted Animals

Acceptance Criteria:

- In the `/animals` route add a search bar that filters only animals whose name matches what is typed in.


