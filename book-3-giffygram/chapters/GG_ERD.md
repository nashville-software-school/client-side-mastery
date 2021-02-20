# Start with the Data

Before you write **ANY** code for an application, you need to understand the types of data _(i.e. resources)_ you are working with, the properties of each resource, and how the resources are related to each other. All of the code that you will write is dependent upon the decisions you make about your data. Once you have started building the application, the more progress you make, the more expensive it is - in both time and money - to make changes to the structure of your data.

In this chapter, you are going to build a visualization of your data and their relationships to each other.

## Learning Objectives

* You should be able to state the purpose of an ERD
* You should be able to able to define what a resource is for an application.
* You should be able to remember that an ERD shows properties and relationships.

## Application Resources

You were introduced to the term **_state_** in the first book. You will be deepening your understanding of the concept, and you ability to correctly apply it in this book. Before you dig into the implementation of state for the application, you need to define an Entity Relationship Diagram (ERD).

The ERD is a critical tool for software developers. It visualizes what the resource for the application look like, and how they are related.

What is a resource? Simply put, it is the kind of data that your users will be creating, deleting, updating, and viewing in your application.

For Giffygram, here's a list of the main resources that need to be represented in your code.

1. Users - People who use the application.
1. Posts - People will create new posts with animation GIFs in them.
1. Messages - People will send messages to other users of the application.

Additionally, a major feature of this application is that users should have the ability to like posts from other users, just as you see on the major social media platforms.

To visualize these resources and relationships, you are going to be using a diagramming tool called [DBDiagram](https://dbdiagram.io/). Watch the following video to see how to use the tool.


## ERD Table Definitions

Now you can open the tool and paste the following definitions into the left panel to have an ERD for Giffygram.

```ddl

```
