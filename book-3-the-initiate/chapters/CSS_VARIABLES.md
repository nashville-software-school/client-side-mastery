# CSS Variables and Modules

When working on applications that is composed of many component that may share common styles, you can now use variables and modules to break up your CSS into more manageable pieces.

By using CSS modules, we only need to include a single CSS file, regardless of how many CSS files actually exist for our project.

```html
<link rel="stylesheet" type="text/css" href="./styles/main.css">
```

## Variables

Imagine you've written a complex application, and your designers have built a color palette that you must use throughout the entire application. Link, cards, headers, lables, input fields, and other components all share common colors. You can define these common colors as variables.

Here's how you do it.

```css
:root {
    --button-font-color: rgb(255, 255, 255);
    --button-bg: white;
    --dark-gold: rgb(223, 186, 1);
    --bright-gold: rgb(243, 197, 0);
    --dark-red: rgb(223, 54, 46);
    --bright-red: rgb(255, 65, 55);
    --dark-blue: rgb(0, 104, 194);
    --bright-blue: rgb(0, 116, 218);
}
```

Now that the color palette has been defined, you can use those variable names in any other selector.

> buttons.css

```css
:root {
    --button-font-color: rgb(255, 255, 255);
    --button-bg: white;
    --dark-gold: rgb(223, 186, 1);
    --bright-gold: rgb(243, 197, 0);
    --dark-red: rgb(223, 54, 46);
    --bright-red: rgb(255, 65, 55);
    --dark-blue: rgb(0, 104, 194);
    --bright-blue: rgb(0, 116, 218);
}

.btn {
  text-decoration: none;
  background-color: var(--button-bg);
  color: #888;
  border-radius: 5px;
  display: inline-block;
  margin: 10px;
  font-size: 18px;
  text-transform: uppercase;
  font-weight: 600;
  padding: 10px 5px;
  min-width: 260px;
}

.btn--orange {
  border-color: var(--dark-red);
  color: var(--button-font-color);
  background-color: var(--bright-red);
}

.btn--blue {
  border-color: var(--dark-blue);
  color: var(--button-font-color);
  background-color: var(--bright-blue);
}

.btn--yellow {
  border-color: var(--dark-gold);
  color: var(--button-font-color);
  background-color: var(--bright-gold);
}

.btn--big {
  font-size: 28px;
  padding: 10px;
  font-weight: 400;
}

.btn--small {
  min-width: 50px;
}

.btn__prompt {
  background-color: var(--button-bg);
  color: #fff;
  padding-right: 12px;
  padding-left: 12px;
  margin-right: -10px;
  font-weight: 600;
  background-color: #333;
  opacity: .4;
  border-radius: 5px 0 0 5px;
  left: 37px;
  float: left;
}

.btn__text {
  padding: 0 50px 0 20px;
  border-radius: 0 5px 5px 0;
}
```

## Modules

Imagine JavaScript modules but for CSS. Each of your DOM components can have their own CSS file that get imported into a main one. The styles for buttons was defined above in `buttons.css`. Next, I'll define all the styles for the cards in my system.

> cards.css

```css
:root {
    --card-bg: darkgray;
}
.card__prompt {
  font-size: 1.1em;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
}

.card__button {
  font-size: 1.1em;
  margin: 30px 0 0 0;
  text-align: center;
}

.card--battleground {
  height: 600px;
  background-color: var(--card-bg);
  color: beige;
  padding: 15px;
}

.card--avatar {
  height: 300px;
  background-color: var(--card-bg);
  color: goldenrod;
  padding: 5px;
}
```

Next, in my main CSS file, I can use the `@import` statement to pull those styles in.

> main.css

```css
@import 'buttons.css';
@import 'cards.css';

body {
  font-family: "Lato", "Helvetica", "sans-serif";
  margin: 0;
  font-size: 3em;
}

.transparent {
  display: none;
}

.field {
  margin: 20px 0 0 0;
}
```

## Resources

1. [MDN article on CSS variables](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_variables)
1. Video: [CSS Variables Tutorial (CSS Custom Properties)](https://www.youtube.com/watch?v=sQUB039MG0I)
1. Video: [CSS Variables - An introduction](https://www.youtube.com/watch?v=PHO6TBq_auI)
