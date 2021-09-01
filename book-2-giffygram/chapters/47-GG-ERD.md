# Start with the Data

Before you write **ANY** code for an application, you need to understand the types of data _(i.e. resources)_ you are working with, the properties of each resource, and how the resources are related to each other. All of the code you will write is dependent upon the data. Once you have started building the application, the more progress you make, the more expensive it is - in both time and money - to make changes to the structure of the data.

In this chapter, you are going to build a visualization of the data and how resources relate to each other.

## Learning Objectives
You should be able to:
* State the purpose of an ERD
* Define what is a "resource" for an application
* Remember that an ERD shows properties and relationships

## Application Resources

An Entity Relationship Diagram (ERD) is a tool for software developers to visualize the resources for an application and how they relate.

What is a resource? It is the kind of data your users will view, create, delete, or update in your application.

For Giffygram, here is the list of the main resources that need to be represented in your code.

1. Users - People who use the application.
1. Posts - Users will create new Posts with animation GIFs in them.
1. Messages - Users will send Messages to other Users of the application.

Additionally, a major feature of this application is that Users should have the ability to like Posts from other Users, just as you see on the major social media platforms.

To visualize these resources and relationships, you are going to be using a diagramming tool called [DBDiagram](https://dbdiagram.io/).

## ERD Table Definitions

Each resource in an application gets a table. For Giffygram, we will start with tables for Users, Posts, and Messages.
   
When building the table, consider what one "User" or "Post" looks like. What are the properties? Also, each entry will have a unique identifier, or "id".

![User and Post visual](./images/47-Resource.png)

Open DBDiagram and create a table for Users and a table for Posts. You can paste the following definitions into the left panel.

```ddl
Table users {
  id int [pk]
  name varchar
  email varchar
  dateJoined date
}

Table posts {
  id int [pk]
  title varchar
  description varchar
  imageURL varchar
  timestamp timestamp
  userId int
 }

Ref: "users"."id" < "posts"."userId"

```

 ### Practice: Messages Table
 Create a table for Messages.
 * What are the properties associated with a single Message?
 * How do you connect Messages to Users and recipients?
 * Share your diagram with a member of the instruction team.

  ### <h3 id="DJ-ERD"> Practice: Create an ERD for your Daily Journal</h3>
 Create an ERD for your Daily Journal. One of the resources should be the Journal Entries.
 * What are the properties associated with a single Journal Entry?
 * When creating the table, consider: what does one Journal Entry look like?
 * Are there any other resources you should define?
 * Once you have the ERD, share your diagram with a member of the instruction team.

 ### <h3 id="MA-ERD"> Practice: Create an ERD for Martin's Aquarium</h3>
 * What are the properties associated with a single Fish?
 * When creating the table, consider: what does one Fish look like?
 * Are there any other resources you should define?