# Blog Part 2

## Prerequisites

> :warning: This exercise requires that you have completed the [Blog Part 1](../../1-the-static-web/exercises/SW_HTML_BLOG_01.md) exercise.

## Setup

1. Create a branch in your `blog` repository named `version-2`, and switch to that branch. `git checkout -b version-2` will create and switch you into that branch.

> This project is made up of several parts. By creating a branch for each section you will be able to preserve the concepts you have learned and able to reference them in the future. We have mentioned you should be commenting your code, right?

## Requirements

Time to make Your blog into a single page application. Before you begin please [review the sample code](../resources/SP_JS_SINGLE_PAGE_APPLICATIONS.md) about building a simple SPA. At this point you should have a minimum of 3 personal blog posts.

### Part One

1. In the navigation bar, make sure you have two links labeled "Blog List", and "Add Blog Entry".
1. Add a DOM element that contains input fields for the user to create a title, date,  author, blog entry and keywords. You do not need to enclose them in a `<form>` element because we're not actually submitting this form anywhere.
1. Add a `<button>` element at the bottom of the input fields labeled "Add".
1. The input fields and the add button make up the *Add Blog Entry View*.
1. The existing view - all the blog entries - will be referred to as the *Blog List View*.
1. The *Add Blog Entry View* should not appear when the user first visits your page. Only the blog list should be visible.
1. When the user clicks on "Add Blog Entry" in the navigation bar, the *Blog List View* should be hidden, and the *Add Blog Entry View* should be shown ([see example wireframe](https://moqups.com/chortlehoort/1E8LJX7r/p:a0cf17f7b)).
1. When the user clicks on "Blog List" in the navigation bar, the *Add Blog Entry View* should be hidden, and the *Blog List View* should be shown ([see example wireframe](https://moqups.com/chortlehoort/1E8LJX7r/p:a8d99d401)).
1. Once the user fills out the blog entry form and clicks the add button, you should collect the values from the input fields, add the blog post to the array of blog objects, and update the blog list in the DOM.

### Part Two

1. Create a JSON file for your blog entries.
1. Read from local JSON file with an XHR.
1. Loop over results and inject into *Blog List View*.
1. Add delete button to each blog entry and, when it is clicked, delete the entire entry in the DOM.
