# Creating a New Post
In this chapter you will add a link to New Post in the Nav Bar and implement the following user stories for the [New Post](./LEARN_WIREFRAME.md#-new-post) view:

**Given** the user wishes to create a new post<br>
**When** the user clicks on ***New Post*** in the Nav Bar<br>
**Then** a form to create a new post will display

**Given** the user wishes to select a topic for the post<br>
**When** the user clicks on the topic dropdown<br>
**Then** a list of the topics should appear<br>

**Given** the user has entered a ***title*** for the post<br>
**And** the user has entered the ***body*** for the post<br>
**And** the user has selected a ***topic*** for the post<br>
**When** the user clicks the save button<br>
**Then** the post will save to the database and ~~the application will navigate to the My Posts view~~

***No need to add the navigate functionality to the My Posts since you have not implemented this view yet.*** 

>💡 You might want to parse the topicId to an int before posting the post to the database

>💡 Remember to reference your ERD when creating a new post object to send to the database. Make sure the new post has all the needed properties.

>💡 Try adding some TODO comments for yourself to keep track of where you need to add additional functionality in the future.
### Helpful Chapters To Revisit

*[Creating a Link](./REPAIR_ROUTES_INTRO.md#creating-a-link)*<br>
*[Refactoring the onChange functions](./REPAIR_EMPLOYEE_EDIT.md#refactoring-the-onchange-functions)*<br>
*[Prevent Default for Forms](./REPAIR_EMPLOYEE_EDIT.md#prevent-default-for-forms)*

Up Next: [Viewing the user's posts](./LEARN_MY_POSTS.md)