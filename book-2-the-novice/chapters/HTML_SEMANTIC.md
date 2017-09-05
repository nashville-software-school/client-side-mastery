# Semantic HTML

**H**yper**t**ext **M**arkup **L**anguage: The structure of content on the Web

## HTML5 Semantic Elements

HTML5 introduces several new semantic elements representing logical sections or components of a web app or document: `<section>`, `<nav>`, `<article>`, `<aside>`, `<hgroup>`, `<header>`, and `<footer>`, along with new rules for using the old `<h1>`–`<h6>` and `<address>` elements. None of the new elements actually “do” anything by themselves, but they provide a much nicer way for web authors to define the various parts of a document, and open the door for user agents and assistive technologies to use this information to enable alternate ways of viewing and navigating a page.

  + __article__ - specifies independent, self-contained content.
  + __section__ - defines sections in a document, such as chapters, headers, footers, or any other sections of the document.
  + __nav__ - contains any navigation elements of the document (navigation bar, breadcrumbs, etc.)
  + __header__ - element represents a container for introductory content and/or a set of navigational links.
  + __footer__ - contains information to be displayed at the bottom of the document
  + __time__ - defines a human-readable date/time. 
    can also be used to encode dates and times in a machine-readable way allowing user agents more functionality (add to calendar) `<time datetime="2008-02-14 20:00">`
  + __mark__ - highlight parts of your text.
  + __aside__ - defines some content aside from the content it is placed in. This content should be related to the surrounding content.

### Forms & element types

Use, or fork, an example [HTML form Codepen project](http://codepen.io/chortlehoort/pen/ogpVZq) to show all the major field types that can be used.

  + form
  + select
  + option
  + textarea
  + text
  + password
  + date
  + submit
  + radio
  + checkbox
  + button
  + range
  + number
  + tel
  + url
  + email

---

## The Document Object Model (DOM)

The Document Object Model is a platform- and language-neutral interface that will allow programs and scripts to dynamically access and update the content, structure and style of documents. The document can be further processed and the results of that processing can be incorporated back into the presented page. This is an overview of DOM-related materials here at W3C and around the web.

<img src="http://www.w3.org/TR/DOM-Level-2-Core/images/table.gif">

The HTML you write is parsed by the browser and turned into the DOM. But your HTML is not the DOM. Mistakes/omissions can be 'fixed' by the browser, such as when you add a `<table>` element in your HTML and leave out the required `<tbody>` element. The browser will just insert that `<tbody>` for you. The Javscript you write can also really change what's rendered far beyond the original markup.

## Further Reading

### Basics
1. [Mozilla Developer Network's Intro to HTML](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Introduction)
1. [HTML Web Foundations: Elements](http://www.sitepoint.com/web-foundations/elements/)
1. [How to Structure an HTML Form](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/How_to_structure_an_HTML_form)

### Advanced
1. [HTML Advanced Tutorial](http://htmldog.com/guides/html/advanced/)
1. [All You Need to Know About the HTML5 Data Attribute ](http://webdesign.tutsplus.com/tutorials/all-you-need-to-know-about-the-html5-data-attribute--webdesign-9642)
1. [Authoring conformance criteria for bidirectional-algorithm formatting characters](http://www.echoecho.com/htmlframes.htm)
1. [HTML5 input types](http://www.htmldog.com/guides/html/advanced/html5forms1/)
1. [More HTML5 tags](http://www.html-5.com/tutorials/new-html-tags.html)