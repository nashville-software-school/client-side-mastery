# HTML Components

Combining comments, semantic HTML, and CSS to build HTML components.

## What Are We Building?

Your instruction staff will do an interactive session with you to build a web page for something fun. You get a voice in this session.

## The Document Object Model (DOM)

The Document Object Model is a platform- and language-neutral interface that will allow programs and scripts to dynamically access and update the content, structure and style of documents. The document can be further processed and the results of that processing can be incorporated back into the presented page. This is an overview of DOM-related materials here at W3C and around the web.

<img src="http://www.w3.org/TR/DOM-Level-2-Core/images/table.gif">

The HTML you write is parsed by the browser and turned into the DOM. But your HTML is not the DOM.

## Semantic Review

HTML semantic tags can be considered components

```html
<article>
    <header>
        <h1>First Week at NSS</h1>
    </header>

    <section>
        Saw some amazing projects from the previous
        cohort. I'm nervous that I won't be able to do
        that in 3 months, but the instructors keep telling
        me that I will.
    </section>

    <footer>
    By Johhny Q. Student &copy; 2018
    </footer>
</article>

<aside>
    <header>
        <h2>Promoted Articles</h2>
    </header>

    <ul>
        <li>First Week at NSS</li>
        <li>Starting NSS Soon</li>
        <li>I Got Accepted!</li>
        <li>Thinking of Attending a Bootcamp</li>
    </ul>
</aside>
```

Here is a visualization for how semantic tags are intended to be in HTML for structuring a typical web page.

![semantic tags](./images/html-semantic-tags.png)

## The Importance of Comments

One of the most important things you can do for yourself, and your teammates, is comment your code. Let's start with adding comments for your components in this HTML snippet.

```html
<!-- Blog Post Component -->
<article>

    <!-- Header Element of Blog Post Component -->
    <header>
        <h1>First Week at NSS</h1>
    </header>

    <!-- Content Element of Blog Post Component -->
    <section>
        Saw some amazing projects from the previous
        cohort. I'm nervous that I won't be able to do
        that in 3 months, but the instructors keep telling
        me that I will.
    </section>

    <!-- Footer Element of Blog Post Component -->
    <footer>
    By Johhny Q. Student &copy; 2018
    </footer>
</article>

<!-- Sidebar Component -->
<aside class="sidebar">
    <!-- Header Element of Blog Post Component -->
    <header>
        <h2>Promoted Articles</h2>
    </header>

    <!-- List Element of Blog Post Component -->
    <ul>
        <li>First Week at NSS</li>
        <li>Starting NSS Soon</li>
        <li>I Got Accepted!</li>
        <li>Thinking of Attending a Bootcamp</li>
    </ul>
</aside>
```

## Intelligent CSS Class Naming Conventions

Styling components intelligently can be handled through naming your classes according to the component name. One popular convention is the [BEM method](http://getbem.com/introduction/).

```html
<!-- Blog Post Component -->
<article class="blogpost">

    <!-- Header Element of Blog Post Component -->
    <header class="header header--xxlarge blogpost__header">
        <h1>First Week at NSS</h1>
    </header>

    <!-- Content Element of Blog Post Component -->
    <section class="blogpost__content">
        Saw some amazing projects from the previous
        cohort. I'm nervous that I won't be able to do
        that in 3 months, but the instructors keep telling
        me that I will.
    </section>

    <!-- Footer Element of Blog Post Component -->
    <footer class="blogpost__footer">
    By Johhny Q. Student &copy; 2018
    </footer>
</article>

<!-- Sidebar Component -->
<aside class="sidebar">
    <!-- Header Element of Blog Post Component -->
    <header class="header header--medium sidebar__header">
        <h2>Promoted Articles</h2>
    </header>

    <!-- List Element of Blog Post Component -->
    <ul  class="sidebar__items">
        <li>First Week at NSS</li>
        <li>Starting NSS Soon</li>
        <li>I Got Accepted!</li>
        <li>Thinking of Attending a Bootcamp</li>
    </ul>
</aside>
```

```css
.blogpost {
    padding: 10px;
    color: goldenrod;
    background-color: fuscia;
    margin: 0;
}

.sidebar {
    border: 1px solid black;
    float: right;
}
```

## Additional Reading

1. [CSS Tricks - BEM](https://css-tricks.com/bem-101/)

## Videos to Watch

1. [Introduction to BEM - A front-end methodology](https://www.youtube.com/watch?v=IO-4Z32O--c)

## Practice

You're going to create an HTML component to represent a political candidate. Specifically, the representative of your Congressional district. Visit the GovTrack site link below, enter in your home address, and you'll find basic information about your representative.

[GovTrack - Congressional District Map](https://www.govtrack.us/congress/members/map)

1. In your HTML, create an `article` tag that will serve as your main representative component. Give the element a unique identifier.
1. In this component, create a sub-component for basic information using the `section` tag. In this section create elements for the representative's image, name, district info, and political affiliation.
1. Beneath the basic information, you will create a sub-component, using a `section` tag, to list any committees the candidate is serving on.
1. The last component will hold links to any legislation that your representative has enacted.

Make sure you use good BEM-style class names for each element in your components. Put a comment above each component explaining what it is.

## UI/UX Challenge
**This is an optional challenge once you meet MVP. Make a new GitHub branch for this challenge.**

> Billboard 101 - Web pages should be designed in such a way that they are easy to scan.

How to improve scannability?
* Create visual hierarchies. What is the most important information on the page? What is supportive information? Can you use bulleted lists?
* Use universally accepted conventions: These may include logo/tagline position, buttons/links, social networking options, etc.
* Break a page into clearly defined sections.
* Make it obvious what’s clickable.

Review the page you just created. Based on the items above, identify some opportunities to improve the UI/UX. Refactor your page to improve the usability. You may add semantic tags, content, and styles.

Background color - if you add a background color/image, ensure the copy (text color) has good contrast and is legible.
