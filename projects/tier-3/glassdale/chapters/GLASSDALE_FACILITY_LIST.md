# Facility List

Now it is time to do the reverse of what you did in the last chapter. You listed facilities per criminal, now you are going to list criminals per facility. You will be writing code similar to what you did for the witness statement list.

Give it your best shot. Your instruction team will let you know how long to work on this, and then they will review the code with you.

## Getting Started

1. Create a `<div class="facility__button"></div>` element in `index.html`.
1. Create a `<article class="facilityContainer"></article>` in `index.html`.
1. Create a **`DisplayFacilitiesButton`** that puts the button into the DOM.
1. Invoke that component function in `main.js`.
1. When the button is clicked, dispatch a custom event named `facilitiesButtonClicked`.
1. The criminal list should listen for that event and toggle its visibility.
1. Create a **`Facility`** component and a **`FacilityList`** component.
1. Create `/styles/facilities.css` file and copy/pasta the code from _statements.css_ and change the colors.

## Listing Facilities

Use the code that you have in **`CriminalList`** for working with many-to-many relationships. Use the code in **`WitnessList`** to toggle the visibility of the list when the corresponding custom event is dispatched.

In the **`Facility`** component, use `map()` to iterate the list of matching criminals that was determined in the **`FacilityList`** component.

![animation of facility list](./images/glassdale-list-facilities.gif)

