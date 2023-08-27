# Learning Moments
> You love to help your fellow classmates, and they love to help you! You've decided to build a social app for sharing those _"Aha!"_ moments of learning how to become a developer. 

You are going to build your own React application based off everything you've learned in Honey Rae's. This is a rather complex project with many possible solutions and many edge cases. It's designed to challenge you and put what you've learned to the test. The goal of this project is not to write a flawless, enterprise-level application. That is not even the desired outcome. The goal is to develop your analytical thinking, algorithmic thinking, and learning efficiency. The desired outcome is a deeper understanding of React and the ability to build a capstone! Revisit previous chapters, rewatch videos, reference the Honey Rae's code, and of course reach out to your peers to help you build this application. 

### Project Setup
```shell
cd ~/workspace
npx create-react-app learning-moments
cd learning-moments
```

Run the following command in your terminal to receive the boilerplate code:
>VF_TODO: Create install script

## The Data
The first step of planning this application is design the ERD and build the database.
```shell
cd ~/workspace
mkdir learning-api
cd learning-api
touch database.json
```

### The Resources
Below are the resources for this application. _(You will need to connect the relationships)_ Use these requirements to build your ERD. Once you are finished, if you would like to run your ERD by an instructor, they would be more than happy to review it with you. Once you are confident you have an accurate ERD, seed your database. 

| Resource | Description |
| -- | -- |
|**`users`** | Where basic user information for all users is stored. A user can create many posts. A user can like many posts. _(name, email, cohort)_ |
|**`posts`** | A post created by a user to share what they've learned. A post can belong to a single topic. A post can be liked by many users. _(title, body, date)_ |
|**`topics`** | A topic of learning. _(e.g. Functions, Asynchronous Programming, etc...)_ Many posts can be written about a single topic. _(name)_  |

## The Plan
This application will have several views, and just like in Honey Rae Repairs, you will begin to build these views piece by piece. Before you get started, however, having an end goal in mind will help with your decision making process as you build. What components will you build? What will your routes be? What components can you reuse? Some guidance will be given for these decisions and others will be left up to you. Carefully read the requirements for each view of this application, then, build a wireframe representing each view and its features. Of course, feel free to review your wireframe with an instructor when you are finished. 

### The Nav Bar
A navbar will persist in each view, allowing the user to navigate through the views of the application. The links on the navbar are as follows:
  1. **All Posts** > links to the view of all the posts
  2. **My Posts** > links to the view of the logged in user's posts
  3. **Favorites** > links to the view of the logged in user's liked posts
  4. **New Post** > links to the view of the new post form
  5. **Profile** > links to the view of the logged in user's profile
  6. **Logout** > will logout the user

### 🖥 New Post
>A form for the user to create a new post with a title, body, and topic.

**Given** the user wishes to select a topic for the post
**When** the user clicks on the topic dropdown
**Then** a list of the topics should appear

**Given** the user has entered a title for the post
**And** the user has entered the body for the post
**And** the user has selected a topic for the post
**When** the user clicks the save button
**Then** the post will save to the database and the application will navigate to the My Posts view

### 🖥 Home/All Posts
>A view for all the posts. 

**Given** the user wishes to view a list of all the posts
**When** the user visits the All Posts view
**Then** the ***title***, ***topic*** and ***number of likes*** will display for each post in the database. 

**Given** the user wishes to filter the posts by topic
**When** the user clicks on the topic dropdown
**And** chooses a topic
**Then** only the posts about the selected topic will display

**Given** the user wishes to search for a post
**When** the user enters a search term in the search input field
**Then** only the posts with a title that contains the search term will display

**Given** the user wishes to view a post
**When** the user clicks on the title of a post
**Then**  the application will navigate to the Post Details view for the post

### 🖥 Post Details
>A view for the user to read a post

**Given** the user wishes to read a post
**When** the user has clicked to view a specific post
**Then** the ***title***, ***author***, ***topic***, ***date***, ***body***, and ***number of likes** should display for the post.

**Given** the user wishes to view the profile of the author 
**When** the user clicks the author's name
**Then** the application will navigate to the Profile View for the author

**Given** the user ***is not** the author of the post
**Then** a button to like the post should display
**When** the user clicks the like button
**Then** the like relationship will save to the database and the application will navigate to the Favorites view

**Given** the user ***is** the author of the post
**Then** a button to edit the post should display
**When** the user clicks the edit button
**Then** the application will navigate to the Edit Post view for the post

### 🖥 Edit Post
>A view to edit a post

**Given** the user wishes to edit their post
**When** the user clicks to edit a post
**Then** a form to edit will display, populated with the current values for the post

**Given** the user wishes to save their changes
**When** the user clicks on the save button
**Then** the post will be updated in the database and the application will navigate to the My Posts view

### 🖥 My Posts
>A view for all the posts the user has written

**Given** the user wishes to view a list of posts they have written
**When** the user visits the My Posts view
**Then** the ***title*** will display for each post the user has written. A button to delete will display next to each post.

**Given** the user wishes to view their post 
**When** the user clicks on the title of the post
**Then** the application will navigate to the Post Details view for the post

**Given** the user wishes to delete their post
**When** the user clicks on the delete button
**Then** the post will be deleted from the database and no longer display on the page. 

### 🖥 Favorites
>A view for all the posts the user has liked

**Given** the wishes to view a list of the posts they have liked
**When** the user visits the Favorites view
**Then** the ***title** will display for each post the user has liked. A button to remove to post from their favorites will display next to each post

**Given** the user wishes to view one of their favorite posts
**When** the user clicks on the title of the post
**Then** the application will navigate to the Post Details view for the post

**Given** the user wishes to unlike a post
**When** the user clicks on the remove button
**Then** the like relationship will be deleted from the database and no longer display on the page.

### 🖥 User Profile
>A view for the details of a user

**Given** the user wishes to view either their profile or another user's profile
**When** the user visits the User Profile view 
**Then** the ***full name***, ***cohort number***, ***number of posts written*** will display for the selected user

**Given** the user is viewing ***their** profile 
***Then** a button to edit should display
**When** the user clicks the edit button
**Then** the application will navigate to the Edit Profile view

### 🖥 Edit Profile
>A form for the user to edit their profile

**Given** the user wishes to edit their profile
**When** the user visits the Edit Profile view
**Then** a form will display to edit the user's ***full name*** and ***cohort number***

**Given** the user wishes to save their changes
**When** the user clicks the save button
**Then** the user will be updated in the database and the application will navigate to the User Profile view for the logged in user