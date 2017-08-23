# Standardize Your CSS Naming with BEM

## Overview

Modern web application teams tend to adopt industry standards in the attempt to make their code base as modular, extensible, and legible as possible. By adopting some standards, new teammates have a much lower learning curve to understand the system, and you tend to gain a strong community that can be accessed for help, if needed.

BEM, developed by the Yandex team, which stands for Block--Element--Modifier, is a system for developers to write their CSS selectors in a way that integrates with their HTML components in an obvious and natural way.

Here's a simple example of how you could use BEM conventions in an application like Music History.


> HTML

```html
<section class="song song--list">
  <span class="song__title">Anonymous Track</span>
  <div class="song__details">
    <span class="song__year">1997 - </span>
    <span class="song__album">If I Were The Moon</span>
  </div>

</section>
```

> CSS

```css
/* The song element block */
.song {
  font-size: 1.0em;
}

/* Song element block modifier for representation in a list */
.song--list {
  border: 1px solid grey;
  font-size: 0.8em;
}

/* The element to display the title of the song */
.song__title {
  font-size: 1.25em;
  font-weight: bold;
}

/* The element for the details of the song */
.song__details {
  margin: 5px 10px;
  line-height: 1.2em;
}

/* Element for displaying the year */
.song__year {
  color: blue;
}

/* Element for the album name */
.song__album {
  text-decoration: italic;
}
```


## Resources

The first few links are specifically about BEM conventions, but you may also be interested in trying other conventions for your CSS. Feel free to explore the other ones.

You need to choose some standard and stick to it when you develop your CSS. Your instruction team will be expecting you to stick to one of these conventions in projects.

* [BEM 101](https://css-tricks.com/bem-101/)
* [Bem.info naming conventions](https://en.bem.info/methodology/naming-convention/)
* [SMACSS](https://smacss.com/)
* [OOCSS](http://oocss.org/)
* [SuiteCSS](https://suitcss.github.io/)
