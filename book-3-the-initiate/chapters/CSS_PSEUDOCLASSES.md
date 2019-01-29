# CSS Pseudo Class Selectors

Pseudo-classes are powerful CSS mechanisms that let you select multiple elements based off of their order of appearance in the HTML, rather than which classes are applied to them.

1. first
1. last
1. nth-of-type
1. nth-child
1. before
1. after

You can also use them to select an element based on how a user has interacted with it.

1. hover
1. active
1. visited

## Related/Fun Resources

1. [Meet the Pseudo Class Selectors](https://css-tricks.com/pseudo-class-selectors/)
1. [30 Cool CSS Animations You Have To See](https://www.hongkiat.com/blog/creative-css-animations/)
1. [Bubble-y Text Fader](https://codepen.io/thousand/pen/BcwAD)

## Videos to Watch

1. [CSS Pseudo Element Selectors Tutorial](https://www.youtube.com/watch?v=3hX5F2upeFQ)
1. [W3Schools CSS Pseudo-classes Tutorial](https://www.youtube.com/watch?v=gtY7VBru06Y)
1. [CSS Tutorial For Beginners 20 - Hover, Active & Visited Effects](https://www.youtube.com/watch?v=XT2PFpOyDzY)
1. [CSS Tutorial For Beginners 21 - First & Last Child Selectors](https://www.youtube.com/watch?v=UxHFB5_CSXc)
1. [CSS Tutorial For Beginners 22 - First & Last of Type Selectors](https://www.youtube.com/watch?v=7eVUWLv6gz4)
1. [CSS Tutorial For Beginners 23 - nth Child Selectors](https://www.youtube.com/watch?v=TVj1avJj8a8)
1. [CSS Tutorial For Beginners 24 - nth of Type Selectors](https://www.youtube.com/watch?v=E45xQZTgaUI)

## Practice

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/css/exercises/pseudo-classes && cd $_
touch index.html
touch pseudo-classes.css
```

## Requirements

Copy and paste the code below into the `index.html` file for this exercise.

> For this exercise you can't add any classes or ids to the provided HTML in order to fulfill the requirements

1. Currently, the `<li>` items are block level elements. Add correct styles to remove the bullets and display them as inline elements.
1. The three `<span>` elements should be displayed as block elements with a 1 pixel border and 25 pixel margin on **all** sides.
1. In the article element with the class `n-child`, add a 1 pixel border around every even numbered section element.
1. Change the top `ul` content to be displayed inline, with a comma between the three numbers.
1. In the article element with the class `n-type`, make each odd section's font color blue.
1. In the article element with the class `first-of-type`, make the first aside element's background color lime.
1. In the article element with the class `first-of-type`, make the first section element's background color purple.
1. In the article element with the class `three`, give each section a background color of orange.
1. In the article element with the class `three`, give the first child element, regardless of type, a background color of goldenrod.
1. In the article element with the class `three`, give the last child element, regardless of type, a background color of darkslategray.
1. Give each article element a title of "Article parent element", a dashed gray border, and a background color of royalblue. Also ensure that it spans the entire length of the document.


```html
<ul class="top">
  <li class="block">1</li>
  <li class="block">2</li>
  <li class="block">3</li>
</ul>

<span class="inline">X</span>
<span class="inline">Y</span>
<span class="inline">Z</span>

<article class="n-child">
  <section> A </section>
  <div> X </div>
  <section> B </section>
  <section> C </section>
  <section> D </section>
</article>

<article class="n-type">
  <section> A </section>
  <section> B </section>
  <aside> Aside </aside>
  <section> C </section>
  <section> D </section>
  <section> E </section>
</article>

<article class="first-of-type">
  <section> A </section>
  <section> B </section>
  <aside> Aside 1 </aside>
  <section> C </section>
  <section> D </section>
  <aside> Aside 2 </aside>
  <section> E </section>
  <footer>Footer</footer>
</article>

<article class="three">
  <section> A </section>
  <section> B </section>
  <aside> Aside </aside>
  <section> C </section>
  <section> D </section>
  <section> E </section>
</article>
```

## Event Pseudoclasses

Create a navigation bar out of an unordered list element, and add the following interactivity.

1. When the user hovers over one of the links, the color of the text should change.
1. When the user hovers over one of the links, the background color of the element that contains the link should change.
1. When the user clicks on one of the links, the element that contains the link should grow in size by 5px on the left and right.
