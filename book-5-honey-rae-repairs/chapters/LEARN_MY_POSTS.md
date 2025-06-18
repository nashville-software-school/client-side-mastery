# Viewing My Posts
In this chapter you will add a link to My Posts in the Nav Bar and implement the following user stories for the [My Posts](./LEARN_WIREFRAME.md#-my-posts) view:

**Given** the user wishes to view a list of posts they have written<br>
**When** the user visits the My Posts view<br>
**Then** the ***title*** will display for each post the user has written. A button to delete will display next to each post.

**Given** the user wishes to view their post<br>
**When** the user clicks on the title of the post<br>
**Then** the application will navigate to the Post Details view for the post

**Given** the user wishes to delete their post<br>
**When** the user clicks on the delete button<br>
**Then** the post will be deleted from the database and no longer display on the page. 

---

### Let's Finish This User Story For New Post!
**Given** the user has entered a ***title*** for the post<br>
**And** the user has entered the ***body*** for the post<br>
**And** the user has selected a ***topic*** for the post<br>
**When** the user clicks the save button<br>
**Then** the post will save to the database and ***the application will navigate to the My Posts view***

### Helpful Chapters To Revisit

*[Creating a Link](./REPAIR_ROUTES_INTRO.md#creating-a-link)*<br>
*[The useNavigate Hook](./REPAIR_EMPLOYEE_EDIT.md#the-usenavigate-hook)*

Up Next: [Introducing conditional routes in Honey Rae's](./REPAIR_EMPLOYEE_VS_CUSTOMER.md)