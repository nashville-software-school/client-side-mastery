# Challenges for Ch 8 & 9: Displaying Data from an API

Before doing this chapter make sure you:
1. Have completed chapters 8 & 9, includig building retrieving data for employees, locations and customers.
1. Are ahead or caught-up to the class discussions.

## Add a computation to your PropsAndState Component

Using a `useEffect` hook, add a "times four" value to the counter in PropsAndState.  The "times four" field should update everytime the counter updates.  

## Add a random Cat image to the Home page.

You may obtain a random cat image from `thecatapi`.  

Start with looking at the data in your browser.  Go to `https://api.thecatapi.com/v1/images/search`.  

1. What does the data structure look like?  

1. How can you use this to display a cat image?  

1. What happens if you refresh your browser?  

Using what you know about calling data from an api and rendering it to a comonent in React, add a component to the home page the renders a random cat image.

Bonus: How can you use the `useEffect` hook to render a random cat image:
1. only ond loading the component
1. with a button click (hint: the button click should change the state of a variable).
1. whenever React re-renders the component.



