# Query the DOM with querySelector()

## Retrieve the First Matching Component

The `document.querySelector()` method allows you to identify the first element that matches the CSS selector you specify.

```html
<article>
    <section class="article__section article__header smallText">
        Welcome to Nashville Software School
    </section>

    <section class="article__section article__body">
        We are ecstatic that you chose us to guide you through your journey to being a software developer.
    </section>

    <section class="article__section article__footer">
        Contact us at info@nashvillesoftwareschool.com
    </section>
</article>
```

```js
/*
    This code will only return the first section component
    even though there are three components with the same
    class
*/
const sectionEl = document.querySelector(".article__section")

/*
    This code will only return the third section component
*/
const footerEl = document.querySelector(".article__footer")

/*
    Get reference to the section with the class of `smallText`
    and remove that class. Then add a new class of `largeText`
*/
const smallTextEl = document.querySelector(".smallText")
smallTextEl.classList.remove("smallText")
smallTextEl.classList.add("largeText")
```

## Retrieve all Matching Components

If you want to get a list of all components that match your selector, you need to use the `document.querySelectorAll()` method.

```js
/*
    This code will return all section components
*/
const sectionEl = document.querySelectorAll(".article__section")

NodeList(3)
0 : section.article__section.article__header
1 : section.article__section.article__body
2 : section.article__section.article__footer
```

```js
/*
    This code will still only return the third section component
*/
const sectionEl = document.querySelectorAll(".article__footer")

NodeList
0 : section.article__section.article__footer
```

## Practice

Add the following code to a new HTML file. Make sure you include a stylesheet named `blog.css`.

```html
<body>
  <article class="article">
    <section class="article__header">
      Welcome to my blog
    </section>
    <section class="article__content">
      Copper mug small batch meh plaid flexitarian. Before they
      sold out occupy chartreuse hot chicken, la croix
      fingerstache offal VHS air plant. Humblebrag blue bottle
      cred af jean shorts etsy copper mug chicharrones cronut
      art party scenester pabst chillwave. Distillery 8-bit
      pabst fashion axe, tousled cloud bread bushwick roof party
      franzen quinoa fixie.
    </section>
    <aside class="aside_box--dark dashed">
      <div class="article__header">
        Very important box header
      </div>
      Messenger bag sriracha tote bag intelligentsia air plant
      leggings.
    </aside>
    <section class="article__footer">
      Author: Steve Brownlee
    </section>
  </article>
</body>
```

> blog.css

```css
.article {
    padding: 10px;
    border: 1px solid blue;
}

.article__header {
    font-size: 1.5em;
}

.article__footer {
    padding: 0 30px;
}

.goldenrod {
    background-color: goldenrod;
}

.dashed {
    border: 1px dashed black;
}
```

1. Use JavaScript to obtain a reference to the first section with the class of `article_header` and change its text with the `textContent` property to "Welcome to the {insert your name here} blog"
1. Use JavaScript to obtain a reference to **all** `article__header` elements and change their `classList` property value to `article__header important`.
1. Obtain a reference the element with a class of `dashed` and remove it.
1. Obtain a reference the element with a class of `article__footer` and add the class of `goldenrod` it.

> **Google tip:** [Find info about classList](http://lmgtfy.com/?q=mdn+javascript+classlist)

## UI/UX Challenge
**This is an optional challenge once you meet MVP. Make a new GitHub branch for this challenge.**

Take a look at five blog sites and notice how posts are displayed? Do they have things in common? What is different? Is there one that is easier to read (or not).

Take this single blog post and match one of the sites you found. Provide a link to the site in your README.md

Make sure your JavaScript still works!
