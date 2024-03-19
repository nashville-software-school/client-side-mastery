# Viewing a Post
In this chapter you will implement the following user stories for the [Post Details](./LEARN_WIREFRAME.md#-post-details) view:

**Given** the user wishes to view a post<br>
**When** the user clicks on the title of a post (in the All Posts view)<br>
**Then** the application will navigate to the Post Details view for the post

**Given** the user wishes to read a post<br>
**When** the user has clicked to view a specific post<br>
**Then** the ***title***, ***author***, ***topic***, ***date***, ***body***, and ***number of likes*** should display for the post.

**Given** the user ***is not*** the author of the post<br>
**Then** a button to like the post should display<br>
**When** the user clicks the like button<br>
**Then** the like relationship will save to the database and ~~the application will navigate to the Favorites view~~

**Given** the user ***is*** the author of the post<br>
**Then** a button to edit the post should display<br>
**When** the user clicks the edit button<br>
**Then** ~~the application will navigate to the Edit Post view for the post~~


***No need to add the navigate functionality to the Favorites View or the Edit view since you have not implemented those views yet.*** 

>💡 Try adding some TODO comments for yourself to keep track of where you need to add additional functionality in the future.


### Helpful Chapters To Revisit

*[Creating a Link](./REPAIR_ROUTES_INTRO.md#creating-a-link)*<br>
*[Route Parameters and the useParams hook](./REPAIR_CUST_DETAILS.md#route-parameters-and-the-useparams-hook)*<br>
*[Ternary Statements](./REPAIR_CUSTOMER_LIST.md#ternary-statements)*

### 💡 JSON Server: Get by Id
If you wish to get a resource by it's primary key (`id`) in json server, rather than adding a query to the url (ex. `?id=`) you can get the single resource by its `id` by adding the `id` to the end of the url: 

```javascript
fetch(`http://localhost:8088/resources/${id}`)
```

Up Next: [Creating a new post](./LEARN_CREATE.md)