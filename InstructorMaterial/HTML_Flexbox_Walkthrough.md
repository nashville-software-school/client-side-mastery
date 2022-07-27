## HTML/CSS Small Group Discussion Guide

These are note for an instructor to use when leading a small group discussion section on html/CSS with a code example.  

1. Basic layout of and html page
1. Semantic HTML tags
1. Flexbox for screen size adjustment
1. Elements Tab Dev Tools
1. Displaying elements side-by-side


Some talking points
- The layout of the html page, head, body, main, title, linking style sheets (and JS)
- Why use semantic elements: browsers, screen readerss, other devs
- Positioning elements side-by-side vs flexbox
- Different ways to flexbox

## Demo Code Example

```html
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Project Title Here</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>
    <body>
      <main>
        <section class="cities">
          <article class="city">Miami</article>
          <article class="city">New York</article>
          <article class="city">L.A.</article>
          <article class="city">Kansas City</article>
          <article class="city">Chicago</article>
          <article class="city">Boston</article>
          <article class="city">Seatle</article>
          <article class="city">Houston</article>
        </section>
        <aside>
          <ul>
            <li>California</li>
            <li>Texas</li>
            <li>Washington</li>
            <li>Montana</li>
          </ul>
        </aside>
      </main>
    </body>
</html>
```

```css
@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");
/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
	color: #404040;
	font-family: "Comfortaa", Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5;
}
h1,h2,h3,h4,h5,h6 {
  font-family: "Patua One", serif;
  letter-spacing: 2px;
}

.cities {
  display:flex;
  flex-wrap: wrap;
  width: 60%;
  float: left;
}

.city {
  margin: 10px;
  border: 1px dotted purple;
  min-width: 100px;
}

.right {
  display: inline;
  width: 35%;
  float: left;
}
```