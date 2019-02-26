# CSS Selectors

CSS uses selectors to determine which elements the current set of styling should be applied to.

## By Id

### HTML

```html
<body>
    <section id="intro">Welcome to my blog</section>
</body>
```

### CSS

```css
#intro {
    background-color: goldenrod;
    border: 1px solid black;
}
```

## By Class

```html
<body>
    <section class="title">Welcome to my blog</section>
</body>
```

### CSS

```css
.title {
    font-size: 1.85em;
    line-height: 1.2em;
}
```

## Descendant Selector

### HTML

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

### CSS

```css
/*
  This will select both of the article__header elements
*/
.article .article__header {
    font-size: 1.85em;
    line-height: 1.2em;
}

/*
  This will select only the section and ignore the div
*/
.article > .article__header {
    font-size: 1.85em;
    line-height: 1.2em;
}
```

## Sibling Selector

```css
/*
  This will select only a section that directly follows another section
*/
section + section {
  margin: 20px 0 10px 0;
}


/*
  This will select all sibling sections regardless if they are direct
*/
section ~ section {
  margin: 20px 0 10px 0;
}
```

## Additional Reading

1. [Child and Sibling Selectors](https://css-tricks.com/child-and-sibling-selectors/)

## Videos to Watch

1. [ID's vs Classes](https://www.youtube.com/watch?v=9UNmumTYuq8)
1. [W3Schools CSS Selectors Tutorial](https://www.youtube.com/watch?v=EeZKHmNJipE)
1. [CSS Basics — Advanced Selectors](https://www.youtube.com/watch?v=oh2JLo2yxCM)
1. [CSS Combinator Selectors](https://www.youtube.com/watch?v=L6Y9Yltj15A)
1. [CSS Tutorials #19 - Child Selectors](https://www.youtube.com/watch?v=KiFo-yKGm6k)
1. [CSS POSITIONING (PART1)](https://www.youtube.com/watch?v=kejG8G0dr5U)

## Practice

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/css/exercises/css-selectors && cd $_
touch index.html
touch selectors.css
```

Paste the code below into your HTML document.

1. The header element should have a 1px, goldenrod border.
1. Convert the `ul` in the navigation element into a series of horizontal links with # as the href value, without bullets, and have some space between them horizontally.
1. Ensure that the navigation is semantically marked as such (i.e. wrap it in the correct HTML tag).
1. Any text in an element with class "disabled" should be colored grey, unless it is an attribute of an anchor tag. If it is an attribute of an anchor tag, it should be colored purple.
1. Any text inside an element with a class of "active" should be colored yellow.
1. Section elements should be contained within an article element.
1. There are two missing closing tags in this document. Make sure you add them back in.
1. Make the `"I'm red"` text colored red.
1. Make the `"I'm blue"` text colored blue.
1. The sibling `h4` of the red element should have a background color of red.
1. The sibling `h4` of the blue element should have background color of blue.
1. Any `h4` that is a direct child of grandparent should have a 1px border with rounded corners.
1. Elements with a class of `promo` should have bold text that is also colored gold.
1. Without adding any other attributes to the `input` fields in the footer, write a CSS selector that makes any text input field have a height of `25px`.

> **Note:** You are not allowed to add `id` and `class` attributes to any component

```html
<header>
  <ul>
    <li>Home</li>
    <li>Profile</li>
    <li>Blog</li>
  </ul>
</header>

<section>
  <div class="month-list">
    <ul>
      <li>
        <a href="#">January</a>
        <span class="disabled">My favorite month</span>
      </li>
      <li>
        <a href="#">
          <span class="active">February</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="disabled">March</span>
        </a>
      </li>
      <li>
        <a href="#">April</a>
      </li>
      <li>
        <a href="#">
          <div class="promo">
            <span class="disabled">May</span>
          </div>
        </a>
      </li>
      <li>
        <a href="#">June</a>
      </li>
      <li>
        <a href="#">July</a>
      </li>
      <li>
        <a href="#">August</a>
        <span class="disabled">My least favorite month</span>
      </li>
      <li>
        <a href="#" class="disabled">September</a>
      </li>
    </ul>
  </div>
</section>

<section>
  <div class="grandparent">
    <div class="parent">
      <h4>Child of parent</h4>
      <div>
        <div>I'm red!</div>
        <h4>I'm red's sister
        <div>I'm blue!</div>
        <h4>I'm blue's brother</h4>
      </div>
    </div>
    <h4>Child of grandparent</h4>
  </div>
</section>

<footer class="padded">

  <div class="disclaimer">
    Only one purchase per household.
    <a href="#">
      <span class="footer-link">
        <span class="disabled">
          Privacy Policy
        </span>
      </span>
  </div>

  <div class="promo">
    Purchase a book today and receive the eBook for free!
  </div>

  <span>
      <input type="text" name="email" placeholder="Enter your email address">
      <input type="text" name="name" placeholder="Enter your name">
      <input type="tel" name="telephone" placeholder="Enter your telephone number">
  </span>

</footer>
```