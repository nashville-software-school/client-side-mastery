# BEM Naming Conventions

BEM is an acronym for Block / Element / Modifier.

## Block

A block would be component that you use in your application.

Imagine you are building a blog application. An example of a block would be each individual article in a list of articles. You would place a CSS class name of `article` on each block.

```html
<article class="article">

</article>
```

## Element

The title, body, date, and author would all be elements of the block. You would place a CSS class name of `article__{element}` on each one.

```html
<article class="article">
    <section class="article__title">
    My First Article
    </section>
    <section class="article__body">
    Food truck pinterest chartreuse ennui. Chartreuse gluten-free 
    slow-carb man bun, YOLO direct trade raw denim swag skateboard 
    venmo mlkshk aesthetic woke gentrify af.
    </section>
    <section class="article__author">
    Bartholomew Pennington
    </section>
    <section class="article__date">
    03/03/2013
    </section>
</article>
```

## Modifier

If you want to have a featured article - one that has slightly different styling - you would have a modifier on the `article` class.

```html
<article class="article--featured">
    <section class="article__title">
    My First Article
    </section>
    <section class="article__body">
    Food truck pinterest chartreuse ennui. Chartreuse gluten-free 
    slow-carb man bun, YOLO direct trade raw denim swag skateboard 
    venmo mlkshk aesthetic woke gentrify af.
    </section>
    <section class="article__author">
    Bartholomew Pennington
    </section>
    <section class="article__date">
    03/03/2013
    </section>
</article>
```

# Reference Articles

1. [CSS for BEM](https://en.bem.info/methodology/css/)
1. [BEM 101](https://css-tricks.com/bem-101/)
1. [Battling BEM – 5 common problems and how to avoid them](https://medium.com/fed-or-dead/battling-bem-5-common-problems-and-how-to-avoid-them-5bbd23dee319)

# Videos to Watch

1. [Introduction to BEM - A front-end methodology](https://www.youtube.com/watch?v=IO-4Z32O--c)
1. [What is BEM CSS and how to use it](https://www.youtube.com/watch?v=Ysf0LhP8jus)
1. [BEM CSS How to apply BEM to your classes](https://www.youtube.com/watch?v=LqBm9R9nrlE)
1. [BEM: complete guide for your component frontend development](https://www.youtube.com/watch?v=xlVRaUZ6WKU)

# Practice

You need to create a component for car dealerships to display details about individual cars on their websites. Here are their requirements. Follow the conventions of BEM to define all of the classes needed.

1. Each car listing component should be 300px wide, have an ivory background, a 1px khaki border, and 5px of padding on each side.
1. Each component will display the make and model of the car at the top. Text color must be SlateGray and 18px in size.
1. Beneath the make/model, the price will be displayed. Price color will be YellowGreen, and 16px in size.
1. Next will be a picture of the car.
1. Beneath the picture of the car, the following specifications will be displayed. Each specification will default to 12px in size and Black in color. The mileage text color will be Crimson. Engine size color will be DarkOliveGreen.
    1. Manufacture year
    1. Color of car
    1. Mileage of car
    1. Engine size
