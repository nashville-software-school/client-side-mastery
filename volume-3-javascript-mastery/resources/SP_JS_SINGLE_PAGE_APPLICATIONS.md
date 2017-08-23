# :pushpin: Exercises

1. [Music History 3](../exercises/SP_JS_MUSIC_HISTORY_3.md)

# Javascript: Simple SPA using events and CSS

Let's look at a very basic implementation of a single page application.

##### index.html

```html
<ul>
  <li><a href="#" id="link-home">Home</a></li>
  <li><a href="#" id="link-list">List</a></li>
  <li><a href="#" id="link-add">Add</a></li>
</ul>

<section id="home-view">
  Home
</section>

<section class="hidden" id="list-view">
  List
</section>

<section class="hidden" id="add-view">
  Add
</section>

<script type="text/javascript" src="home.js"></script>
<script type="text/javascript" src="list.js"></script>
<script type="text/javascript" src="add.js"></script>
```

##### styles.css

```css
ul > li {
  display: inline;
  list-style-type: none;
  margin: 5px 15px 0 15px;
  background-color: goldenrod;
  padding: 5px;
}

.visible {
  display: block;
}

.hidden {
  display: none;
}

body {
  font-size: 2em;
}
```

##### home.js

```js
var homeLink = document.getElementById("link-home");
var homeView = document.getElementById("home-view");

homeLink.addEventListener("click", function() {
  homeView.classList.add("hidden");
  addView.classList.add("hidden");

  homeView.classList.add("visible");
  homeView.classList.remove("hidden");

});
```

##### list.js

```js
var listLink = document.getElementById("link-list");
var listView = document.getElementById("list-view");

listLink.addEventListener("click", function(event) {
  event.preventDefault();
  homeView.classList.add("hidden");
  addView.classList.add("hidden");

  listView.classList.add("visible");
  listView.classList.remove("hidden");
});
```

##### add.js

```js
var addLink = document.getElementById("link-add");
var addView = document.getElementById("add-view");

addLink.addEventListener("click", function() {
  homeView.classList.add("hidden");
  listView.classList.add("hidden");

  addView.classList.add("visible");
  addView.classList.remove("hidden");

});
```
