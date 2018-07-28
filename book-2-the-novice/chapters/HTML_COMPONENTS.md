# HTML Components

Combining comments, semantic HTML, and CSS to build HTML components.

## The Document Object Model (DOM)

The Document Object Model is a platform- and language-neutral interface that will allow programs and scripts to dynamically access and update the content, structure and style of documents. The document can be further processed and the results of that processing can be incorporated back into the presented page. This is an overview of DOM-related materials here at W3C and around the web.

<img src="http://www.w3.org/TR/DOM-Level-2-Core/images/table.gif">

The HTML you write is parsed by the browser and turned into the DOM. But your HTML is not the DOM.

## Semantic Review

HTML semantic tags can be considered components

```html
<nav>
    <li>
        <a href="index.html">Home</a>
    </li>
    <li>
        <a href="careers.html">Careers</a>
    </li>
    <li>
        <a href="locations.html">Locations</a>
    </li>
</nav>
```

## The Importance of Comments

One of the most important things you can do for yourself, and your teammates, is comment your code. Let's start with adding comments for your components in this HTML snippet.

```html
<!-- Navigation Bar Component -->
<nav>
    <!-- Navigation Link List Component -->
    <ul>
        <!-- Navigation Link Component -->
        <li>
            <a href="index.html">Home</a>
        </li>
        <li>
            <a href="careers.html">Careers</a>
        </li>
        <li>
            <a href="locations.html">Locations</a>
        </li>
    </ul>
</nav>
```

## Intelligent CSS Class Naming Conventions

Styling components intelligently can be handled through naming your classes according to the component name. One popular convention is the [BEM method](http://getbem.com/introduction/).

```html
<!-- Navigation Bar Component -->
<nav class="navigation">
    <!-- Navigation Link List Component -->
    <ul class="list list--navigation">
        <!-- Navigation Link Component -->
        <li class="listitem--navigation">
            <a href="index.html">Home</a>
        </li>
        <li class="listitem--navigation">
            <a href="careers.html">Careers</a>
        </li>
        <li class="listitem--navigation">
            <a href="locations.html">Locations</a>
        </li>
    </ul>
</nav>
```

```css
.navigation {
    padding: 5px;
    background-color: black;
    margin: 0;
}

.list {
    line-height: 1.1em;
}

.list--navigation {
    list-style-type: none;
    line-height: normal;
}

.listitem--navigation {
    display: inline;
    margin: 0 20px;
}
```

## Additional Reading

1. [CSS Tricks - BEM](https://css-tricks.com/bem-101/)

## Videos to Watch

1. [Introduction to BEM - A front-end methodology](https://www.youtube.com/watch?v=IO-4Z32O--c)
1. [020 CSS Architecture Components and BEM](https://www.youtube.com/watch?v=8wX78mtlNyU)

## Practice

You're going to create an HTML component to represent a political candidate. Specifically, the representative of your Congressional district. Visit the GovTrack site link below, enter in your home address, and you'll find basic information about your representative.

[GovTrack - Congressional District Map](https://www.govtrack.us/congress/members/map)

1. In your HTML, create an `article` tag that will serve as your main representative component. Give the element a unique identifier.
1. In this component, create a sub-component for basic information using the `section` tag. In this section create elements for the representative's image, name, district info, and political affiliation.
1. Beneath the basic information, you will create a sub-component, using a `section` tag, to list any committees the candidate is serving on.
1. The last component will hold links to any legislation that your representative has enacted.

Make sure you use good BEM-style class names for each element in your components. Put a comment above each component explaining what it is.
