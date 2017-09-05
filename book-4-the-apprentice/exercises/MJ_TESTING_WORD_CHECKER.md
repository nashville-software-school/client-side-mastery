# Word Checker Testing

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/mjd/wordchecker && cd $_
```

## Requirements

You are going to use these concepts to build a JavaScript application that fulfills the following requirements. Check out all of the [possible uses](https://facebook.github.io/jest/docs/api.html#expect-value) of the `expect` function to meet the requirements.

You are going to work on a simple test scenario.

Write a test suite to validate your JavaScript functions.

1. There should be a function defined with the name `checkWordCount`.
1. That function should return false if a string sent to it has more than 100 words in it.
1. There should be a function defined with the name `duplicateCheck`.
1. That function should return false if a string has duplicate words in it.
1. There should be a function defined with the name `verifyAlphaNumeric`.
1. That function should return false if there are any non-alphanumeric characters in a string.

Now that the test suite exists, write a simple application to implement the functionality.

1. In an HTML file, have two elements: a textarea and a button.
2. When the button is clicked, extract the contents of the textarea and validate it against the following rules.
3. There should only be alphanumeric characters in the text. No special characters like $%^&*.
4. No duplicate words allowed.
5. Word count should be less than 100.