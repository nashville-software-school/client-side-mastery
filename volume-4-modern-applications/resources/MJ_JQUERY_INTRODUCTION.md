# :pushpin: Exercises

1. [Music History 5](../exercises/MJ_JQUERY_MUSIC_HISTORY_5.md)

# Introduction to jQuery

jQuery is about to make your life a bit easier as a developer. You've learned how to do some amazing things with vanilla JavaScript, which you will continue to use, but jQuery can make some of the more complex tasks simple.

jQuery came on to the scene in the late 2000's and got adopted with lightning speed, as it allowed front end developers to write a single line of code and have it work in all the major browsers, which at that point had enough differences in how the DOM was rendered that it was a non-trivial task to write code that worked between them.

At its core, jQuery allows a developer to quickly obtain references to DOM elements, like you've been doing with `getElementById` and `getElementsByClassName`, and then update the content of those elements. You've been using `innerHTML`, and `appendChild` and `removeChild` and other related vanilla JavaScript methods, but jQuery makes the syntax much more concise.

## Introduction

> **Term:** CDN is an acronym for Content Delivery Network which is a way for companies to distribute their code throughout the globe to strategic points, so that downloads are faster.

1. Create the directory `~/workspace/jquery` and create an `index.html` file and a `script.js` file and link them together.
1. Visit the [jQuery download page](https://jquery.com/download/#using-jquery-with-a-cdn) where you can copy the first line of code in that section. You do not need the one with the word `migrate` in it.
1. Paste that into your HTML file above the script tag to your JavaScript file.
1. Open your `script.js` file and add the following code
```js
$(document).ready(function() {
  // All the JavaScript that depends on jQuery will be written here
});
```

## DOM manipulation

In your HTML file, put the following sample DOM between the body tags.

```html
<article class="article--main" id="top-article">
  This is the very first article in my document.
</article>

<article class="article--main" id="middle-article">
  This is the middle article in my document.
</article>


<button class="delete">Delete</button>

<div class="container">
  <h1 umbrella="open">Song list</h1>
  <section class="song-container" index="0">
    <div class="song">
      <div umbrella="closed" class="title">The Walk</div>
      <div class="artist">Mayer Hawthorne</div>
      <div class="album">How Do You Do</div>
    </div>
  </section>
</div>
<button id="destroyer">Hide song</button>

<ul id="letters">
  <li class="letter a">a</li>
  <li class="letter b">b</li>
  <li class="letter c">c</li>
  <li class="letter d">d</li>
</ul>

<input type="text" name="first_name" id="firstName" value="10">
<div class="echo"></div>
```

### Selecting and reading contents of DOM elements

Now you can write your first, simple jQuery code. In your DOM create the following element.

```html
<article class="article--main" id="top-article">
  This is the very first article in my document.
</article>
```

Now in `script.js`, select the DOM element. Selectors in jQuery are **exactly** like CSS selectors - `#` for id, and `.` for class.

```js
$(document).ready(function() {
  // All the JavaScript that depends on jQuery will be written here

  // Select the article DOM element by its id attribute
  var article = $("#top-article");
  console.log("article", article);
});
```

You can also select an element by its class.

```js
$(document).ready(function() {
  // All the JavaScript that depends on jQuery will be written here

  // Select the article DOM element by its class attribute
  var article = $(".article--main");
  console.log("article", article);
});
```

Or the tag name

```js
$(document).ready(function() {
  // All the JavaScript that depends on jQuery will be written here

  // Select the article DOM element by its class attribute
  var button = $("button");
  console.log("button", button);
});
```

Or by attribute

```js
$(document).ready(function() {
  // Select by attribute
  var umbrellaElement = $("h1[umbrella='open']");
  console.log("umbrella text: ", umbrellaElement.html());
});
```

## Selecting child elements

```js
$(document).ready(function() {
  // Select all children
  console.log("all children: ", $(".container").children());
});
```

To select a specific child, simply chain another selector.

```js
$(document).ready(function() {
  // Select specific children
  console.log("the h1: ", $(".container").children("h1"));
  console.log("the section: ", $(".container").children("section"));
});
```

If there's a specific item you want to select, and you know its location, but not any other specific identifier, you can select by index.

```js
$(document).ready(function() {
  // Select specific child index (useful for ul/ol)
  // Example of chaining selectors
  console.log("third li: ", $("#letters").children(".letter").eq(2).html());
});
```

However, the more selectors you chain together, the more expensive the operation. More processing power and memory is needed as you chain selectors. To alleviate this, jQuery provides the `find()` method.

```js
$(document).ready(function() {
  // Finding an element
  var album = $(".container").find(".album");
  console.log("album", album.html());
});
```

## Selecting sibling elements

To get the next sibling of an element.

```js
$(document).ready(function() {
  // Selecting next sibling
  var aSibling = $(".a").next();
  console.log("aSibling: ", aSibling.html());
});
```

Get all sibling elements.

```js
$(document).ready(function() {
  // Selecting all siblings
  var siblings = $(".a").nextAll();
  siblings.each(function(index, el) {
    console.log("sibling text: ", $(el).html());
  });
});
```

## Get the value of a form field

Instead of `html()`, you can use `val()` to get the current value of any input element.

```js
$(document).ready(function() {
  // Working with form fields and the val() method
  console.log("field value: ", $("#firstName").val());
});
```

## Updating the DOM

```js
$(document).ready(function() {
  // To completely replace the contents of a DOM element,
  // we used to write element.innerHTML = "something new";
  $(".container").html("something new");
});
```

```js
$(document).ready(function() {
  // To append the contents of a DOM element,
  // we used to write element.innerHTML += "something new";
  $(".container").append("something new");
});
```

## Listening for events

You've learned how to use `addEventListener` in vanilla JavaScript, and jQuery makes the syntax even simpler.

```js
$(document).ready(function() {
  // Handling click events
  $("#destroyer").click(function() {
    $(".container").hide();
    // $(".container").show();
    // $(".container").toggle();
  });

  // Handling a keyup event
  $("#firstName").keyup(function() {
    $(".echo").html($(this).val());
  });
});
```

## Resources

* Jquery Introduction [Slides](https://docs.google.com/presentation/d/1qFah7FONXEGXpOLbYONfGKdd2RC1kHtMIu2cw7btEIY/edit?usp=sharing)
