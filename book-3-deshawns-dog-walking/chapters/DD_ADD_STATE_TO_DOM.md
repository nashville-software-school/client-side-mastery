# Adding State to the DOM

When you look at any interactive web application, like Facebook or Amazon, you are viewing the state, or data, that the developers of the application want you to see. Lurking beneath the surface of the visible, is often an invisible layer of additional state that is being used to make the page more interactive.

<img src="./images/lurking.jpeg" width="350px" />

That state hidden beneath what you are looking at enables developers to do some powerful things.

1. Show popup information
2. Display different color choices for a product
3. Alert notifications


## HTML Data Attributes

One way developer store invisible state in a web page is with [HTML Data Attributes](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes). You have been using some basic attributes of HTML elements already.

The `id` attribute is very common.

```html
<article id="listOfFish"></article>
```

The `class` attribute is also very common and used for styling.

```html
<li class="tropicalFish">Barnaby</li>
<li class="tropicalFish">Horace</li>
<li class="tropicalFish">Alice</li>
```

You also have the power to define your own attributes to store state, or data, in an HTML element. For example, you could store the primary key of an object as a data attribute that will be invisible to the user.

```html
<li class="tropicalFish" data-id="1">Barnaby</li>
<li class="tropicalFish" data-id="6">Horace</li>
<li class="tropicalFish" data-id="9">Alice</li>
```

## Implementing Data Attributes

There is an article linked above that you are encourage to read. Then watch a video for how to implement additional state in your HTML when generating it with JavaScript.

[<img src="../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/JI0eaiPwi4bZ8AmSoYCK)
