
## Semantic HTML

Semantic elements in HTML are elements which convey some meaning about the content.  For example, an h1 element is considered a header1.  When the browser sees an element as an h1, it automatically styles it larger and to look like a header. We could take a h1 element and use CSS to style it like a paragraph or a div element and style it like an h1.  You may wonder why we don't do that.  Here a few reasons:

1. It takes more work to write expicit style for each element.
1. It's more maintenance of code to keep all styles consistent.
1. Screenreaders also look at the element to decipher the meaning.
1. SEO uses html elements to decipher importance and meaning.
1. Other developers can understand your code better.  Note: future you is another developer!


Without going into details, a browser takes html and and converts it into what we see on the screen.  

## Visual Review of Semantic Elements

What is a component and how do HTML elements apply to the concept? 

Look at the image below to see an overview of semantic HTML elements and how they are intended to be used together.

![semantic tags](https://github.com/nashville-software-school/client-side-mastery/blob/E20/HTML_CSS_FLEXBOX/Images/html-semantic-tags.png)


## Naming Conventions

A naming convention is simply the way a dev team has agreed to write code so that all members understand the intent.  It is important to keep your code organized and readable to other developers.  Even on personal projects, stick to a convention.  It's a great habit to be in and potential employers may be looking at your code.  

Here's an example of something that will be deciferable now, but think about what happens when the code base gets larger.

```css
  .a {
    background-color: 'pink';
  }

  .b {
    margin: 50px;
  }

  #dog {
    color: 'blue';
  }
```

```html 
  <h1 id="dog">All about Chickens</h1>
  <ul>
    <li class="a b">hen</li>
    <li class="a">roster</li>
    <li class="b a">duck</li>
    <li class="b">eagle</li>
  </ul>
```

The above example has poor naming convention. While that is small enough for our brains to sort out, imagine if this persisted over hundreds of html elements on multiple pages!   

Try to put yourself in someone's shoes reading your code.  Using naming convnetions are one of the things we do to help with this.  

Styling components intelligently can be handled through naming your classes according to the component name. One popular convention is the [BEM method](http://getbem.com/introduction/).

If you were creating an HTML component that represents you, here's an example of how the code would look using HTML semantic elements and BEM class names.

```html
<main>
    <!-- Parent biography component -->
    <article class="bio">

        <!-- Child biography component -->
        <section class="bio__name">
            <h1>Sally Forthwright</h1>
        </section>

        <!-- Child biography component -->
        <section class="bio__address">
            100 Infinity Way, Nashville
        </section>

        <!-- Child biography component -->
        <section class="bio__interests">
            <div class="interest">
                Oyster harvesting
            </div>
            <div class="interest">
                Juggling
            </div>
            <div class="interest">
                Triathlons
            </div>
        </section>

    </article>
</main>
```

Each of those components can be styled individually with a clear, concise name that also provides some semantic context when looking at the CSS file. Before you style them, all you have is structure as some very basic, default styles that the browser applies to your elements.
<<<<<<< HEAD

## More Informtion

This is not required reading/watchi, but good references.

Written:

https://www.thoughtco.com/why-use-semantic-html-3468271

https://learn-the-web.algonquindesign.ca/topics/html-semantics/

https://developer.mozilla.org/en-US/docs/Glossary/Semantics

Written and Video:

https://blog.hubspot.com/website/semantic-html
=======
>>>>>>> 6a2da8c1d38f4f54dc9a680baf701fcb1c324918
