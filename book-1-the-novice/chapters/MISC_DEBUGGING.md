# Errors and Debugging

## How to read an error

In any development language you use, when an error occurs in your code, you will always be provided with what's called a [stack trace](https://en.wikipedia.org/wiki/Stack_trace) that will tell you what line of code was currently being evaluated, and in which file that code is located. You will be expected to read the stack trace whenever an error occurs, and investigate the exact line of code for obvious syntax errors before asking for help from staff.

Look at the example image below. You'll see that the error shows the name of the file, and the line of code on which it occurred. I then click on the file and it highlights the code right there in the browser.

![debugging](./../../book-2-the-neophyte/chapters/images/EI5yqRpHMa.gif)

## Using the network tab

The network tab in the developer tools lets you see all of the files that a website uses to present HTML, style it with CSS, and add interactivity with JavaScript.

![network tab](./../../book-2-the-neophyte/chapters/images/V4gjom0YaS.gif)

You can then click on each file and look at all of the metadata for it. If the requested file was data, in JSON format, you can click the the Preview section to explore the data.

![response metadata](./../../book-2-the-neophyte/chapters/images/A8LRi4fxHq.gif)

## Debugging Your Code in the Browser

There are three main methods for debugging code your code in the browser.

1. `console.log`
1. `debugger;`
1. Breakpoints

### console.log

The `console.log()` method in JavaScript allows you to display any information you want in the Console tab of the browser. You can display simple messages.

```js
for (let i = 0; i < 6; i++) {
  console.log("I am inside the loop now")
}
```

Or you can display the current value of a variable to test that your logic is working correctly. In the example below, I have an array of three string values. I use `console.log()` to display the entire contents of the array. I then add two, new elements to the end of the array. I want to make sure that it worked, so I `console.log()` the length of the array to ensure that those two items got added.

![using console.log](./../../book-2-the-neophyte/chapters/images/hVRYheNVUL.gif)

### debugger

Using the `debugger;` keyword somewhere in your code will force the browser to halt execution so that you can review your code right in the browser and see what the values of variables are at that moment. In the example below, I put in a `debugger` statement so that I can see what is contained inside the colors array, and then I can step one line of code at a time and see how it changes.

![using debugger](./../../book-2-the-neophyte/chapters/images/sL7Z1090JD.gif)

### Using Breakpoints

In this example, I have a block of code that responds to user input, so it doesn't actually execute as soon as the page loads. I put a breakpoint on the line of code that I want to examine, and when the user performs the appropriate action, my JavaScript halts execution and I can examine the code.

![using breakpoints](./../../book-2-the-neophyte/chapters/images/v8W1107o8K.gif)

## Debugging Code with Visual Studio Code

1. Install the `Debugger for Chrome` extension.
1. In any project directory that you want to debug, add a `.vscode` sub-directory.
1. Create `.vscode/launch.json`.
1. Copy the configuration below into the file.
    ```js
    {
        "version": "0.1.0",
        "configurations": [
            {
                "name": "Launch localhost",
                "type": "chrome",
                "request": "launch",
                "url": "http://localhost:8080/",
                "webRoot": "${workspaceRoot}"
            }
        ]
    }
    ```
1. Start `http-server` in your project directory.
1. Open the Debug Panel in VS Code.
1. Click the *Start Debugging* button.

## Catching Errors

Sometimes, an error is unavoidable, or even expected in certain conditions. If you have a set of steps in your code that you know **may** cause an error, but under the right condition, will work correctly. In this situation, you put your code inside of a try/catch block.

It does what it sounds like. The JavaScript engine will execute the code in the `try` block. If an exception occurs, the code in the `catch` block will be executed, otherwise it is ignored.

### try/catch

```js
try {
    const domElement = document.getElementById("dynamicallyAddedElement");
    domElement.innerHTML = "I was added after the user clicked on a button.";
} catch (exception) {
    console.error("The dynamic element has not been added to the DOM yet.");
}
```

The try/catch block allows your program to continue running, even if an error occurs. This is because you are now giving instructions on what should happen if an error does occur. Otherwise, the exception is unhandled and the program stops working.
