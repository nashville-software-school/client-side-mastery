# HTML Components

## Why Are You Learning This?

Thinking of applications and web page as a collection of independent components is the foundation of modern web applications that you use all the time.

* Snapchat
* Instagram
* Twitter
* Facebook
* Etsy
* Pinterest

All of these applications are written by teams of software developers who define the individual components that are used throughout their application. They then write each component separately and combine them in interesting ways and make them work together.

## HTML Elements

The visual part of the UI is made up of the HTML content and the styles (CSS, SASS, etc.).  HTML is written in individual pieces, called elements.  An HTML element can be made of a single piece of content or it can contain other HTML elements.  

For example, a `<h1>` element usually just contains the content of the header, but a `<ul>` element usually contains a bunch of `<li>` elements.  

```html
<h1>Hello World!</h1>
```

vs. 

```html
<ul>
  <li>Apples</li>
  <li>Grapes</li>
  <li>Strawberries</li>
</ul>
```


## Anatomy of an HTML Element

![./Images/flexbox.png](https://github.com/nashville-software-school/client-side-mastery/blob/E20-Lynn-htmlContent/HTML_CSS_FLEXBOX/Images/HTML_Tag_Anatomy.png)

Opening Tag: The start of the html tag

Attributes: Properties on an html element.  In the example above they are "id" and "class", but there can be other properties too.  Some comone properties indlude: id, class, href, src.   

Attribute Values: This is the value associated with an attribute.  In the example above the id="nurse".  If we are looking for the element with an id of nurse, this would be that element.  

Content: This is what gets displayed.  

Closing Tag: This indicates the element is now finished.  

## Atributes

- HTML elements can have many different attributes.

- The class attribute can have many values.  The differented classes are separated by a space.  In the example below, the element has the classes book, series and movie.

  `<li class="book series movie">Harry Potter and the Chamber of Secrets</li>`

  You could have an element with one, some, all or none of those classes.  For example:

    `<li class="book movie">Holes</li>`

  has the classes book and movie, but not series.  If CSS or JavaScript targets the class "Series", this element will not be included.  If it targets "book" or "movie", it will be included.

- A class can be given to many elements on the same html page.  For example, you would like to give a red background to several different elements on your webpage.  You can give each of these elements the class of red and then include in your css

  ```css
  .red {
    background-color: 'red';
  }
  ```

- The id attribute value should be unique to the whole html document.  For example in the example above where id="nurse".  It is not good practice to create another html element where id="nurse".  Style sheets and JavaScript may not behave the way you think.

More Information: This is not required reading, but good references.

https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes

https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes

## Self Closing Tags

These tags do not require a closing tag.  

`<img src="example.png" alt="example image" />`

## More complex example:
`<input type="text" id="fname" class="form personalInfo" placeholder="First Name" hidden/>`

This input is a self-closing tag.  An input element is used to allow users a place to add data, such as on a form.  Here we have defined the type to be "text".  Other common types are: date and number.

This input has an id of "fname".  When we want to identify the element by the id, we look for "fname". 


## Common HTML elements include:

Block: an element that occupies 100% of the available width has a line break before and after the element
```html
<div>, <p>, <h1>, <h2>, <h3>, <h4>, <h5>, <h6>, <form>, <ol>, <ul>, <li>,  
```

Inline:an element that takes up as much space as it needs or is styled to take-up.
```html
<img>, <a>, <span>, <input>, <button>
```
Semantic:  define the meaning, structure, or style of the element. 
```html
<article>, <aside>, <details>, <figure>, <footer>, <header>, <main>, <nav>, <section>, <summary>
```

## More Information

This is not required reading, but good references.

Written:

  https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/HTML_basics

  https://www.tutorialrepublic.com/html-tutorial/html-elements.php

  https://developer.mozilla.org/en-US/docs/Web/HTML/Element

Video:

 https://www.youtube.com/watch?v=XXrpsQqAlIQ

 
