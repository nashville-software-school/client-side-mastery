# HTML Components

What is a component and how do HTML tags apply to the concept?

![semantic tags](./images/html-semantic-tags.png)


## CSS Class Naming Conventions

Styling components intelligently can be handled through naming your classes according to the component name. One popular convention is the [BEM method](http://getbem.com/introduction/).

## Fish in my Aquarium

Let's build an HTML page that displays all of the fish in our aquarium at home.

1. What are the components?
2. What should be the class names for each?
3. Which semantic tags should we use?
4. How can we use Flexbox to build a better layout of fish?


## Additional References

1. [CSS Tricks - BEM](https://css-tricks.com/bem-101/)
1. [Introduction to BEM - A front-end methodology](https://www.youtube.com/watch?v=IO-4Z32O--c)

## Practice: Congressional Representative

You're going to create an HTML component to represent a political candidate. Specifically, the representative of your Congressional district. Visit the GovTrack site link below, enter in your home address, and you'll find basic information about your representative.

[GovTrack - Congressional District Map](https://www.govtrack.us/congress/members/map)

1. In your HTML, create an `article` tag that will serve as your main representative component. Give the element a unique identifier.
1. In this component, create a sub-component for basic information using the `section` tag. In this section create elements for the representative's image, name, district info, and political affiliation.
1. Beneath the basic information, you will create a sub-component, using a `section` tag, to list any committees the candidate is serving on.
1. The last component will hold links to any legislation that your representative has enacted.

Make sure you use good BEM-style class names for each element in your components. Put a comment above each component explaining what it is.

## Practice: Coffee Houses of Nashville

> The learning objective for this practice exercise is to use `display:flex` on two elements, and then add additional CSS properties to achieve a desired layout.

```html
<header class="pageHeader">Coffee Houses of Nashville</header>

<article class="list">
  <section class="shop">The Jam</section>
  <section class="shop">The Well</section>
  <section class="shop">Red Bicycle</section>
  <section class="shop">Crema</section>
  <section class="shop">Frothy Monkey</section>
  <section class="shop">8th &amp; Roast</section>
  <section class="shop">Bongo Java</section>
  <section class="shop">Flatrock</section>
  <section class="shop">Fido</section>
  <section class="shop">Steadfast Coffee</section>
  <section class="shop">Dose Coffee</section>
  <section class="shop">Sam &amp; Zoes</section>
  <section class="shop">Slow Hand Coffee</section>
  <section class="shop">The Horn</section>
</article>
```

From that HTML, use Flexbox to achieve this layout. You don't need to add the border. It's been added in this example to highlight the alignment and spacing you're shooting for.

![flexbox layout](./images/flexbox.png)

## Congressional Representative UI/UX Challenge

**This is an optional challenge once you meet the requirements above. Make a new GitHub branch for this challenge.**

> UX CONCEPT: Web pages should be designed in such a way that they are easy to scan.

How to improve scannability?
* Create visual hierarchies. What is the most important information on the page? What is supportive information? Can you use bulleted lists?
* Use universally accepted conventions: These may include logo/tagline position, buttons/links, social networking options, etc.
* Break a page into clearly defined sections.
* Make it obvious what’s clickable.

Review the page you just created. Based on the items above, identify some opportunities to improve the UI/UX. Refactor your page to improve the usability. You may add semantic tags, content, and styles.

Background color - if you add a background color/image, ensure the copy (text color) has good contrast and is legible.


## Coffee Houses UI/UX Challenge
**This is an optional challenge once you meet MVP. Make a new Github branch for this challenge.**

Creating visual hierarchies
1. Add an address, phone number, and website link to each coffee house (you may use mocked data)
2. Using semantic HTML and CSS, style each coffee house component with the goals of easy scannability. At a minimum, you will emphasize the name of each shop and make the website link clearly clickable.

Background color - if you add a background color/image, ensure the copy (text color) has good contrast and is legible.



