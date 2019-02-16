# Creating Components in Vanilla JavaScript

You have been introduced so far to using functions to perform tasks, and string templates for building text and HTML to put in the DOM. In this chapter, you are going to combine the two topics to define functions that use string templates to build components.


Creating an independent component that can be used anywhere in your application has been a goal of JavaScript developers since the mid-2000s. The reason being that component-based systems are infinitely flexible and composable, allowing for faster development and modifications of features.

## Student Info Component

In the next 2 months, you are going to be using JavaScript to generate HTML representations of raw data structure - like objects - to display in the browser. In this lesson, you're going to be writing JavaScript to build the following HTML structure representing a student at NSS.

We'll call this student Alejandro Font.

```html
<div class="student">
    <h1>Alejandro Font</h1>
    <section>Day cohort 27</section>
    <aside>
        Wore pants that were too short for his legs.
        Routinely showed up late. Was an incredible
        friend to his teammates.
    </aside>
</div>
```

### HTML Generation Function

The first step is to write a function that returns that literal HTML string.

```js
const createStudentComponent = () => {
    return `
        <div class="student">
            <h1>Alejandro Font</h1>
            <section>Day cohort 27</section>
            <aside>
                Wore pants that were too short for his legs.
                Was an incredible friend to his teammates.
            </aside>
        </div>
    `
}
```

Then you can invoke that function and update the DOM with the HTML string that it returns.

```js
// Then store a reference to an existing HTML element
const studentContainer = document.querySelector("#container")

// Update its contents with the return value of the function
studentContainer.innerHTML = createStudentComponent()
```

## Making it Dynamic

The function you wrote isn't very powerful. It doesn't show off the true power of a function because software developers do not hard code data into the HTML like that. The data comes from a database or an API (you will learn more about those later) and then stored in JavaScript inside arrays.

Consider the following example of a collection of twelve students.

```js
const students = [
    {
        name: "Chris Miller",
        subject: "History",
        info: "Failed last exam",
        score: 59
    },
    {
        name: "Courtney Seward",
        subject: "History",
        info: "Has completed all homework",
        score: 91
    },
    {
        name: "Garrett Ward",
        subject: "History",
        info: "Wonderful at helping other students",
        score: 88
    },
    {
        name: "John Dulaney",
        subject: "History",
        info: "Has never missed a class or exam",
        score: 92
    },
    {
        name: "Greg Lawrence",
        subject: "History",
        info: "Sub-par performance all around",
        score: 64
    },
    {
        name: "Leah Duvic",
        subject: "History",
        info: "Wonderful student",
        score: 97
    },
    {
        name: "Jesse Page",
        subject: "History",
        info: "Smokes too much. Distracting.",
        score: 76
    },
    {
        name: "Kevin Haggerty",
        subject: "History",
        info: "Falls asleep in class",
        score: 79
    },
    {
        name: "Max Wolf",
        subject: "History",
        info: "Talks too much",
        score: 83
    },
    {
        name: "Lissa Goforth",
        subject: "History",
        info: "Asks pointless, unrelated questions",
        score: 78
    },
    {
        name: "Tyler Bowman",
        subject: "History",
        info: "When was the last time he attended class?",
        score: 48
    },
    {
        name: "Ray Medrano",
        subject: "History",
        info: "Needs to contribute to in-class discussions",
        score: 95
    }
]
```

You would not write 12 different function, with each one being responsible for generating one of the students.

```js
// The following code is not dynamic

const createRayMedrano = () => {
    // HTML here
}
const createTylerBowman = () => {
    // HTML here
}

etc...
```

You, as a software developer, would write a function that could generate HTML to represent any of those students. The way you can change the output, or logic, of a function is by using function arguments.

It's time for you to rewrite the function to accept the information it needs to do its job. It's job is to generate an HTML representation of a student, so it must define arguments to store that input.

You are using 3 of the 4 properties on each student object to build the HTML. You're not using `score` yet. Define those 3 arguments.

```js
const createStudentComponent = (name, subject, info) => {
    return `
        <div class="student">
            <h1>Alejandro Font</h1>
            <section>Science</section>
            <aside>
                Wore pants that were too short for his legs.
                Was an incredible friend to his teammates.
            </aside>
        </div>
    `
}
```

Now that the arguments have been defined in the parenthesis of the function, it's time to refactor the function body to use them to build the HTML string. You would use the process of _string interpolation_ to inject the value of the arguments into the string.

String interpolation is accomplished by using a dollar sign followed by curly braces.

Use interpolation to evaluate a variable.

```js
`${studentName}`  // "Alejandro Font"
```

Use interpolation to evaluate an expression.

```js
`${studentName.length > 4}`  // "true"
```

Note that you can only do this when you use the backtick character to build the string. It will not work when using single quote or double quote to build the string. Time for you to finish the refactor and use interpolation for the arguments.

```js
const createStudentComponent = (name, subject, info) => {
    return `
        <div class="student">
            <h1>${name}</h1>
            <section>${subject}</section>
            <aside>${info}</aside>
        </div>
    `
}
```

Now you can invoke the function, pass different values into its arguments, and get different output.

```js
const lissa = createStudentComponent(
    "Lissa Goforth",
    "History",
    "Asks pointless, unrelated questions")

const courtney = createStudentComponent(
    "Courtney Seward",
    "History",
    "Has completed all homework")

const greg = createStudentComponent(
    "Greg Lawrence",
    "History",
    "Sub-par performance all around")
```

Now that you have a function that dynamically builds HTML strings based on its input (via arguments), now you can iterate the array of students and use the function.

```js
const studentContainer = document.querySelector("#container")


for (let i = 0; i < students.length; i++) {
    const student = students[i]
    studentContainer.innerHTML += createStudentComponent(
        student.name,
        student.subject,
        student.info
    )
}
```

## Changing Functionality Based on a Particular Property

Ten of the students are currently passing the course, and two students are not. You want passing, and non-passing, student information to be styled differently. You want passing students' names to be green, and non-passing students to be orange.

How might you refactor the function body again to use the `score` property of each student object to change the output of the function?

## Practice: Student Components

1. Create a new project sub-directory in your `workspace/javascript` directory.
1. Paste the array of student objects above into your JavaScript file.
1. Copy the `createStudentComponent` function into your code.
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
    for (const student of students) {
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
    <h1 class="xx-large passing">Student Name</h1>
    <section class="bordered dashed section--padded">Subject</section>
    <aside class="pushRight">Additional information</aside>
</div>
```

## Practice: One Object to Rule Them All

Instead of defining four arguments for the `createStudentComponent` function, and then passing the individual properties when it is invoked, refactor the function to accept the entire object as a single argument.

Then refactor your string interpolation code to use the object properties.

---

> Challenges are optional exercises that you should only attempt if you have completed the practice exercises, and fully understand the concepts used in them.

## Challenge: Composition of Smaller Components

Write functions that build the sub-components of the larger student component.

* h1
* section
* aside

Invoke those functions inside the `createStudentComponent` function to build the parent `<div>`.

```js
const createStudentComponent = (student) => `
    <div id="student">
        ${h1(student.name)}
        ${section(student.subject)}
        ${aside(student.info)}
    </div>
`
```

## Challenge: Generic HTML Function

Look at the three functions you created to build an `h1`, a `section`, and an `aside`. Notice that each one follows the same pattern of accepting a single argument - a string - and outputting a single HTML component. Since there is a pattern, you can consider writing a single function that generalizes the creation of an HTML component even further.

Create one function that will generate **any** HTML component, with **any** content. It should be defined with three arguments.

1. The type of HTML component to make
1. The content of the component
1. The value of the `class` attribute

```js
const createStudentComponent = (student) => `
    <div id="student">
        ${element("h1", student.name, "xx-large passing")}
        ${element("section", student.subject, "bordered dashed section--padded")}
        ${element("aside", student.info, "pushRight")}
    </div>
`
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
