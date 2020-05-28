# A Methodical Approach to Planning Software

For a beginner, being rigorous and intentful about how to plan your project is critical since you don't have any of the skills internalized yet. It takes years and years to visualize the plan before you code, and even then, documenting your approach always works.

## How to Plan

Your instruction team will review the [How to Plan](https://docs.google.com/presentation/d/1VZORNkDFbKtwlsr4DzR4JB8GmX-NZifpcE78Bi_4gKo/edit?usp=sharing) slide deck with you. This is a great reference for all future projects, including your personal capstone project.

## Wireframes

Use sketchboard.io to draw simple wireframes for where the content and buttons should be on the browser. Your wireframes are the first step in constraining what you should do. All the work you do should be focused exclusively on what you want to present to your customers and what actions they can perform.

## Dependency Graph

This graph determines the order in which you write the code. Any module of code that has many modules that depends upon it, but it doesn't depend on anything else is always the first thing you implement.

Then you work your way down to the module that depends on the most modules, but no other modules depend on it.

Your instruction team will do a sample dependency graph so you can see how to do it.

## Deconstruct Goals into Achievable Tasks

Often a large goal seems unattainable, but once you and your teammates break it down into the tasks needed to achieve the goal, you will find that each tasks is far easier to write code for. It provides you the focus needed, and once all the smaller tasks are done, the once-unattainable goal is attained.

For example, for Martin's Aquarium, a large goal that could be defined is "Implement a list of all fish tanks that Martin recommends."

_"Ugh, I can't do that!"_ you might think to yourself. However, you'll find the implementing each of these tasks is much less daunting.

1. Create a `tankList` section in the HTML.
1. Create a `tankData.js` module.
1. Define the properties on a tank.
1. Create a new `"tanks"` collection in the `database.json` file.
1. Create some sample tank objects in the `database.json` file.
1. Create an empty `tanks` array in the data module.
1. Write a function in `tankData` that fetches and parses all of the tanks from the API.
1. Update the `tanks` array with the data that was fetched from the API.
1. Create a `tankList.js` module.
1. Write a `for..of` loop that iterates the objects in the `tanks` array.
1. Create a `tank.js` module for converting each object to HTML.
1. In the `for..of` loop, invoke the `tank()` function and pass the object as an argument.
1. Take the resulting HTML representation and update the DOM with `.innerHTML`

This process of deconstruction will get easier each time you do it. It's hard now, but it won't be if you keep a growth mindset, allow yourself to make mistakes and learn from them, and keep practicing.
