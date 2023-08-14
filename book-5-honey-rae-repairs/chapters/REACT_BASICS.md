# Getting Started with React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and it doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with JavaScript modules
1. Updating the DOM with document elements or string templates
1. Setting the state of a component

## Creating the Application

Run the following commands to do the basic software package installations

```sh
cd ~/workspace
npx create-react-app honey-rae-repairs
cd honey-rae-repairs
npm install --save react-router-dom
```
## Project Setup

We are giving you some boilerplate (starter) code that you will then customize as you build out the Honey Rae Repairs application with React. Run the following command in your terminal.

<!-- TODO: Change this link to cohort 66 branch -->

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/react-redesign/book-5-honey-rae-repairs/chapters/scripts/react-setup.sh)"
```
## Installing React Developer Tools

You can install the React Developer Tools via the [Chrome Store](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi).
You will get two new tabs in your Chrome DevTools:

* ⚛️ Components
* ⚛️ Profiler

These tools will help you debug and inspect your React applications.

## React Developer Tools

Watch the Intro to React Dev Tools video below to review their usage. Again, just like with VanillaJS, your use of the React dev tools is the only other way than using the debugger to gather evidence.

[<img src="./images/react-dev-tools-video.png" />](https://www.youtube.com/watch?v=rb1GWqCJid4)


## Starting Your React Application

In your terminal, make sure you are in the top-level project directory, and not in the `public` or `src` sub-directory, and type the following command.

```sh
npm start
```

The process of building your React application will begin and the following things will happen.

1. Your browser will automatically open the `http://localhost:3000` URL.
1. You will see the following message in your terminal.
    ```sh
    Compiled successfully!

    You can now view honey-rae-repairs in the browser.

    Local:            http://localhost:3000
    On Your Network:  http://10.0.0.27:3000

    Note that the development build is not optimized.
    To create a production build, use npm run build.

    webpack compiled successfully
    ```
1. In your browser the app should be running with no errors and you should see this welcome page:
   <img src="./images/welcome.png" width="600" border="3px solid black"/>
   
If these three things do not happen, call in an instructor. Otherwise, move on to the next chapter.