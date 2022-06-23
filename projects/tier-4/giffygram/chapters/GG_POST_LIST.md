# Single Responsiblity Principle

You have seen the term Single Responsibility in previous chapters. At its core, this principle can be described with the following statement.

> You should be able to explain a single purpose for each module, and each function in your application.

A straightforward explanation, yes, but understanding and following this principle requires a significant amount of failure in following it first. It is both powerful and subtle.

Beginners struggle with sublety because they want concrete rules to follow.

However, by following this principle, you will end up with having a code base that is easier to maintain, easier to extend, and easier to change. You will work on your understanding of this principle throughout the course.

## Learning Objectives

* You should be able to remember the general definition of the Single Responsbility Principle.
* You should be able to remember the definition of the term _"code refactor"_.
* You should be able to explain the Single Responsbility of all modules and functions you have written so far.
* You should be able to understand that invoking a function inside a string template injects the return value of that function into the string.

## Single Responsbility Components

Take a look at your **`Giffygram`** component code.

```js
import { NavBar } from "./nav/NavBar.js"
import { getPosts } from "./store/index.js"

export const GiffyGram = () => {
    const allPosts = getPosts()
    let giffyGramHTML = NavBar()

    for (const postObject of allPosts) {
        const htmlRepresentationOfThisPost = `
            <section class="post">
                <header>
                    <h2 class="post__title">${postObject.title}</h2>
                </header>
                <img class="post__image" src="${postObject.imageURL}" />
            </section>
        `
        giffyGramHTML += htmlRepresentationOfThisPost
    }

    return giffyGramHTML
}
```

Can you state the single purpose of the Giffygram function?

You could choose to say that its Single Responsiblity is to generate all of the HTML for your application. In a general sense, this is true. However, does it generate the HTML for the navigation bar?

No, it defers that responsibility to the **`NavBar`** function. It **does** generate the HTML for the posts, though.

What if you stated the responsibility of the function to be, _"It determines the order in which all of the components in the application are rendered"_?

It is doing that. By invoking **`NavBar`** first, and then generating the HTML for posts, it does control the order.

Since its Single Reponsiblity is no longer the generation of the HTML, but rather defining the order, or overall layout, then it must also defer the generation of the posts HTML to another component.

## The PostList Component

Time for your first code refactor.

| | |
|:---:|:---|
| <h1>&#x270e;</h1> |  _Code refactoring is the process of restructuring existing computer code._ |


Follow these steps to see if you can do the refactor yourself. If you have a hard time with the instructions, you can talk to your teammates or a member of the instruction team.

1. Create a new directory: `giffygram/src/scripts/post`
1. In that directory, create a module named `PostList.js`
1. Create and export a function named `PostList` in that module.
1. Move the `for..of` loop from the `Giffygram` function module into the `PostList` function.
1. Return the post list HTML.

Give it a shot, but don't get to the point of frustration. You are still new at this. If you've tried to write the code for 20-30 minutes, but feel stuck, you can [copy the implemented code](./PostList.js) and then try to understand what each line of code it doing.


| | |
|:---:|:---|
| <h1>&#x2757;</h1> |  _If you augmented your existing code to display more information about the post beyond the title and image, you'll need to make sure you add that if you copy the code provided by the course.._ |

## Refactor Giffygram

Now that the responsibility of building the post list HTML has been deferred to another component, the **`Giffygram`** component can focus on putting it all together in the right order.

```js
// Make sure you import the PostList function at the top of the file

export const GiffyGram = () => {
    let giffyGramHTML = NavBar()
    giffyGramHTML += PostList()

    return giffyGramHTML
}
```

Another way to write it is by using string interpolation.

```js
export const GiffyGram = () => {
    const giffyGramHTML = `
        ${ NavBar() }
        ${ PostList() }
    `

    return giffyGramHTML
}
```

This 2nd way is, visually, much more like the code you will write when you start to learn React in a few weeks. We recommend that you write it this way.

If it doesn't make sense, please see a member of the instruction team to build your understanding.