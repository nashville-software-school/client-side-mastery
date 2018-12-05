# Creating Components in Vanilla JavaScript

You have been introduced so far to using functions to perform tasks, and string templates for building text and HTML to put in the DOM. In this chapter, you are going to combine the two topics to define functions that use string templates to build components.


Creating an independent component that can be used anywhere in your application has been a goal of JavaScript developers since the mid-2000s. The reason being that component-based systems are infinitely flexible and composable, allowing for faster development and modifications of features.

## Student Info Component

You will create three functions that will help you build your very first component, which will be composed of three separate HTML elements.

### Title Element Function

Consider you have the following HTML code.

```html
<article id="container"></article>
```

By adding this tiny function to your JavaScript, you can create `<h1>` elements, with a given CSS class.

```js
const h1 = (title, style) => {
    return `<h1 class="${style}">${title}</h1>`
}
```

Now you can add an `h1` inside the container article that already exists using the `innerHTML` property.

```js
document.querySelector("#container").innerHTML = `
    ${h1("Marcus Fulbright", "xx-large")}
`
```

Once that code runs, you will have the following DOM.

```html
<article id="container">
    <h1 class="xx-large">Marcus Fulbright</h1>
</article>
```

### Component Structure

This may seem overly complicated when all you need to do is write the `h1` element where needed. Why create a function to do it for you? Consider the case where you need to display the information for 12 students in the DOM. Each student will be represented in HTML with the following structure.

```html
<div class="student">
    <h1>Student Name</h1>
    <section>Student class</section>
    <aside>Additional information</aside>
</div>
```

You've already created a function for the `h1`, so you create two more functions for the `section` and the `aside`. However, you want to ensure that **all** section elements are bordered with a dashed line.

```js
const section = (title, style) => {
    return `<section class="bordered dashed ${style}">${title}</section>`
}

const aside = (title, style) => {
    return `<aside class="${style}">${title}</aside>`
}
```

### Component Function

You can then use these functions to create a student component function.

```js
const student = (name, class, info) => `
    <div id="student">
        ${h1(name, "xx-large")}
        ${section(class, "section--padded")}
        ${aside(info, "pushRight")}
    </div>
`

const container = document.querySelector("#container")
container.innerHTML = student("Marcus Fulbright", "Algebra", "Not a bright student")
```

10 of the students are currently passing the course, and 2 students are not. You want passing, and non-passing, student information to be styled differently. You want passing students' names to be green, and non-passing students to be orange.

Here's a sample student list.

```js
const students = [
    {
        name: "Chris Miller",
        class: "History",
        info: "Failed last exam",
        score: 59
    },
    {
        name: "Courtney Seward",
        class: "History",
        info: "Has completed all homework",
        score: 91
    },
    {
        name: "Garrett Ward",
        class: "History",
        info: "Wonderful at helping other students",
        score: 88
    },
    {
        name: "John Dulaney",
        class: "History",
        info: "Has never missed a class or exam",
        score: 92
    },
    {
        name: "Greg Lawrence",
        class: "History",
        info: "Sub-par performance all around",
        score: 64
    },
    {
        name: "Leah Duvic",
        class: "History",
        info: "Wonderful student",
        score: 97
    },
    {
        name: "Jesse Page",
        class: "History",
        info: "Smokes too much. Distracting.",
        score: 76
    },
    {
        name: "Kevin Haggerty",
        class: "History",
        info: "Falls asleep in class",
        score: 79
    },
    {
        name: "Max Wolf",
        class: "History",
        info: "Talks too much",
        score: 83
    },
    {
        name: "Lissa Goforth",
        class: "History",
        info: "Asks pointless, unrelated questions",
        score: 78
    },
    {
        name: "Tyler Bowman",
        class: "History",
        info: "When was the last time he attended class?",
        score: 48
    },
    {
        name: "Ray Medrano",
        class: "History",
        info: "Needs to contribute to in-class discussions",
        score: 95
    }
]
```

## Practice: Student Components

1. Create a new project.
1. Paste the array of student objects above into your JavaScript file.
1. Put the `h1`, `section`, and `aside` functions into your JavaScript file.
1. Add the following styles to your CSS.
    ```css
    #container {
        display: flex;
        flex-direction: column;
    }

    .pushRight {
        margin-left: auto;
    }

    .xx-large {
        font-size: 3em;
    }

    .bordered {
        border-width: 1px;
        border-color: goldenrod;
        border-style: solid;
    }

    .dashed {
        border-style: dashed;
    }

    .section--padded {
        padding: 10px;
    }

    .passing {
        color: green;
    }

    .failing {
        color: orange;
    }
    ```
1. Add a container article to your HTML.
    ```html
    <article id="container"></article>
    ```
1. Iterate the array of students, and apply the correct style to the `h1` depending on the score of the student being below 60, or above it.
    ```js
    for (student of students) {
        let studentComponent = ""
        if (student.score >= 60) {
            studentComponent = ...
        } else {
            studentComponent = ...
        }
    }
    ```

If a student is passing, then the structure should look like the following.

```html
<div class="student">
    <h1 class="xx-large green">Student Name</h1>
    <section class="bordered dashed section--padded">Student class</section>
    <aside class="pushRight">Additional information</aside>
</div>
```

## Practice


---

> Challenges are optional exercises that you should only attempt if you have completed the practice exercises, and fully understand the concepts used in them.

## Challenge: Use Rest Operator

This will allow you to pass as many arguments to your component-building functions as you want without the need to define each one in the argument list.

```js
const h1 = (...props) => {
    return `<h1 class="${props[0]}">${props[1]}</h1>`
}
```

Change your functions to use the rest operator.

## Challenge: Generic HTML Function

Look at the three functions you created to build an `h1`, a `section`, and an `aside`. Notice that each one follows the same pattern of applying the `style` argument, and the `content` argument in the same locations.

```js
const h1 = (...props) => {
    return `<h1 class="${props[1]}">${props[0]}</h1>`
}

const section = (...props) => {
    return `<section class="bordered dashed ${props[1]}">${props[0]}</section>`
}

const aside = (...props) => {
    return `<aside class="${props[1]}">${props[0]}</aside>`
}
```

Can you think of a way to make a more generic function that not only takes the style and content as arguments, but also the element type?

```js
const h1 = element("h1", "Generic Component Maker", "xx-large orange")
```

## Advanced Challenge: Using createElement for Components

> The learning objective of this challenge is to move away from using string templates completely, and use the methods of `createElement()` and `appendChild()` to create DOM components.


### createElement()

JavaScript provides the `document.createElement()` method which creates a virtual DOM element that doesn't exist in the DOM until you add it.

### appendChild()

The `document.appendChild()` method will take a virtual DOM element you created and attach it as a child element of another one.

### Usage

```js
// Create an unordered list element
const list = document.createElement('ul')

// Create a list item for our list
const listItem = document.createElement('li')
listItem.className = "president"
listItem.textContent = "George Bush"

// Put the list item on the unordered list
list.appendChild(listItem)

console.log(list)
```

When you insert the `list` object to the DOM, it will generate the following HTML.

```html
<ul>
    <li class="president">George Bush</li>
</ul>
```

### Creating Elements

Using `createElement()`, you're going to create a simple list of chat messages that you might have with one of your family members. Maybe it's that wacky aunt that you see every Christmas and Fourth of July.

1. Put an `article` DOM element in your index.html with the `id` attribute value of `messages`.
1. In your JavaScript, use `querySelector()` to obtain a reference to that `article` DOM element.
1. Create five (5) `section` components, each with a class of `message`, and with the content of your choosing.
1. Using `appendChild()`, attach each message as a child to the `messages` element.

Example output.

```html
<article id="messages">
    <section class="message">
        Are we doing fireworks this year?
    </section>
    <section class="message">
        After last year's "tree incident", should we?
    </section>
    <section class="message">
        The fire fighters put it out in like a minute. Wasn't even a real fire.
    </section>
    <section class="message">
        We can set them off in the street.
    </section>
    <section class="message">
        Our neighbors' houses are flammable, too
    </section>
</article>
```

## Advanced Challenge: DOM Fragments

### createDocumentFragment()

What you did in the previous challenge was actually an expensive way of adding those elements to the DOM. Now, it didn't cost you any extra money, but it was expensive in terms of memory and processing power. When the DOM is written to, layout is 'invalidated', and at some point needs to be reflowed.

We can use a document fragment to reduce the processing and layout cost of constant, rapid-fire DOM updates. You can add as many components to it as you like, and then add the fragment to the DOM as a one-time operation.

```js
// A new "virtual" document fragment to contain components
const fragment = document.createDocumentFragment()

// Create an emperor component element
const julius = document.createElement('div')
julius.textContent = "Julius Caesar"
fragment.appendChild(julius)

// Create an emperor component element
const augustus = document.createElement('div')
augustus.textContent = "Augustus Caesar"
fragment.appendChild(augustus)

// Create an emperor component element
const aurelius = document.createElement('div')
aurelius.textContent = "Marcus Aurelius"
fragment.appendChild(aurelius)

/*
    Now I can update my HTML document all at once, with all
    three emperor components rendered. Otherwise, I would
    have needed to add each one, individually - a much more
    "expensive" operation.
*/
document.querySelector("#emperorList").appendChild(fragment)
```

### Practice Document Fragment

Update your code from the previous challenge to add the chat messages to the `messages` elements via a document fragment.
