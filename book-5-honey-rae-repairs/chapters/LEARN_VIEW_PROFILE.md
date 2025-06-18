# Viewing a User's Profile
In this chapter you will add a link to Profile in the Nav Bar and implement the following user stories for the [User Profile](./LEARN_WIREFRAME.md#-user-profile) view:

**Given** the user wishes to view either their profile or another user's profile<br>
**When** the user visits the User Profile view<br>
**Then** the ***full name***, ***cohort number***, ***number of posts written*** will display for the selected user

**Given** the user wishes to view the profile of the author (in the Post Details view)<br>
**When** the user clicks the author's name<br>
**Then** the application will navigate to the Profile View for the author

**Given** the user is viewing ***their*** profile<br>
**Then** a button to edit should display<br>
**When** the user clicks the edit button<br>
**Then** ~~the application will navigate to the Edit Profile view~~

***No need to add the navigate functionality to Edit Profile since you have not implemented this view yet.*** 

>💡 Try adding some TODO comments for yourself to keep track of where you need to add additional functionality in the future.


### Helpful Chapters To Revisit

*[Route Parameters and the useParams hook](./REPAIR_CUST_DETAILS.md#route-parameters-and-the-useparams-hook)*<br>
*[Ternary Statements](./REPAIR_CUSTOMER_LIST.md#ternary-statements)*

### 💡 Which Profile?
Try making only one component for this view. If the user clicks on the Profile link in the NavBar, their details should be displayed in the profile component. If the user clicks on another user's name in the Post Details view, that user's details should be displayed in the profile component. 

Up Next: [Editing the user's profile](./LEARN_EDIT_PROFILE.md)