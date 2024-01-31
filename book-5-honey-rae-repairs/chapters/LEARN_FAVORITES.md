# My Favorite Posts
In this chapter you will add a link to Favorites in the Nav Bar and implement the following user stories for the [Favorites](./LEARN_WIREFRAME.md#-favorites) view:

**Given** the user wishes to view a list of the posts they have liked<br>
**When** the user visits the Favorites view<br>
**Then** the ***title*** will display for each post the user has liked. A button to remove to post from their favorites will display next to each post

**Given** the user wishes to view one of their favorite posts<br>
**When** the user clicks on the title of the post<br>
**Then** the application will navigate to the ***Post Details*** view for the post

**Given** the user wishes to unlike a post<br>
**When** the user clicks on the remove button<br>
**Then** the like relationship will be deleted from the database and no longer display on the page.

---

### Let's Finish This User Story for Post Details!
**Given** the user ***is not*** the author of the post<br>
**Then** a button to like the post should display<br>
**When** the user clicks the like button<br>
**Then** the like relationship will save to the database and the application will navigate to the ***Favorites*** view

## You're killin' it 

Up Next: [Viewing the user's profile](./LEARN_VIEW_PROFILE.md)