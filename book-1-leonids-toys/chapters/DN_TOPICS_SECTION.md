# Note Topic Sections

Now you need to create some `<section>` HTML elements for each note article.

## Instructions

Update the code that you wrote in the last section to include each topic, contained in a child `<section>` element for each note. You will need to use a nested `for..of` loop again. Also, update the output to be a multi-line string using string templates.


```html
<article>
    Always work on a branch and submit a PR, even if I'm working on my own project.
    <section>strategy</section>
    <section>github</section>
</article>
```

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should output similar to the following example.

```html
***  Note Articles  ***
<article>
    Always work on a branch and submit a PR, even if I'm working on my own project.
    <section>strategy</section>
    <section>github</section>
</article>
<article>
    Review all my old code before asking for help or looking at hints.
    <section>strategy</section>
    <section>help</section>
    <section>professional</section>
</article>
<article>
    I have found that slowing down and thinking about the problem, and writing out the comments makes it vastly easier to write code.
    <section>thinking</section>
    <section>help</section>
</article>
```

## Hint

Remember, use all the other resources at your disposal before looking at hints. Start thinking like a professional now and become an efficient learner, not a lazy one.

<details>
    <summary>Algorithm</summary>

The first hint is a good algorithm for this problem. You should be able to start on the code with this. Future hints can get you going if you get stuck with code.

```js
/*
    Since the string has to be built up in parts - in both
    the outer loop and the inner loop - start off with a
    variable that has an initial value of an empty string.
*/


/*
    Iterate all notes
*/


/*
    Inside the iteration of all notes, add the open article
    tag and the note text.
*/


/*
    Then iterate the `topics` array for the current note.
*/


/*
    Create a string template with an opening and closing
    <section> element with the topic text interpolated
    between them. Then add the string template to the
    variable created at the start with the += operator.
*/


/*
    After both for..of loops are done, add the closing
    </article> tag to the end of the main string with +=
*/
```
</details>

<details>
    <summary>Main string</summary>

```js
let allHTML = ""
```
</details>

<details>
    <summary>Adding the article to the main string</summary>

```js
allHTML += `<article>
${note.text}`
```
</details>

<details>
    <summary>Adding sections to the main string</summary>

```js
const section = `<section>${topic}</section>`
allHTML += section
```
</details>
