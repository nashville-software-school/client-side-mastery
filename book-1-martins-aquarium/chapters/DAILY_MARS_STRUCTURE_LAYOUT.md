# Bludgeons &amp; Flagons

## The Making of the Most Popular Tavern Game of the Middle Ages

You are going to be building an application that uses two [NASA APIs](https://api.nasa.gov/).

1. Mars Rover Photos API
1. Astronomy Picture of the Day API

Your client is [Debra Fischer](https://www.radcliffe.harvard.edu/people/debra-ann-fischer), a principal investigator with the N2K Consortium searching for exoplanets. She was part of the team to discover the first known multiple-planet system.

Debra is starting an amateur atronomers club and she wants an application that the kids can use to explore what was going on in the Solar System on different dates.

## Learning Objectives

The learning objectives of this project, by the end of the client side course, are the following.

* Using `fetch` to retrieve data from 3rd-party providers
* Event listeners
* Understanding asynchronous programming
* Collecting user input and acting on it
* Modular CSS
* Modular JavaScript
* Identifying and building components

Here are the features you will be building over the next few months in this application. It will allow Debra to...

* View Mars probe photos on a specific date.
* Whatever the most popular atronomy photos was that day.
* Favorite individual pictures. What will be saved about that picture is as follows:
    * Image URL
    * If it was from a probe, the probe name
    * If it was from a probe, the probe camera
* Remove photos from favorite list.
* Filter photos by specific cameras. Each probe has a different set of cameras.

Given those feature requests, what you need to do in this chapter is the following tasks.

1. Visit https://api.nasa.gov/ and get yourself an API key so you can access their data.
1. Identify the components that need to be rendered in this application.
1. Identify the structure and relationship of the components _(e.g. a Photo component is rendered as a child of the MarsDay component, etc...)_
1. Decide on a layout for your Daily Mars application. Draw a simple wireframe that shows where each component will be rendered.
1. Come see a member of the instruction team to review your component layout.
1. After discussing your layout, you can then create a new project directory of `~/workspace/eyes-on-the-sky`, and start building the HTML and CSS of your components and layout.

> **Reminder:** Remember to create a CSS file for each component, and use the `@import` statement in `main.css` to include each one. Also consider what sub-directories you will need under the `scripts` directory, if any. Discuss with your instructor.