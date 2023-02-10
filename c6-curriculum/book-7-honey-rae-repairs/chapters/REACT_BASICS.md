# Getting Started with React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and it doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with JavaScript modules
1. Updating the DOM with document elements or string templates
1. Setting the state of a component

## Installing React Developer Tools

You can install the React Developer Tools via the [Chrome Store](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi).
You will get two new tabs in your Chrome DevTools:

* ⚛️ Components
* ⚛️ Profiler

These tools will help you debug and inspect your React applications.

## React Developer Tools

Watch the Intro to React Dev Tools video below to review their usage. Again, just like with VanillaJS, your use of the React dev tools is the only other way than using the debugger to gather evidence.

[<img src="./images/react-dev-tools-video.png" />](https://www.youtube.com/watch?v=rb1GWqCJid4)

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

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-7-honey-rae-repairs/chapters/scripts/react-setup.sh)"
```

It will create the following directories and files for your project.

```
- src
    - components
        - auth
            - Login.css
            - Login.js
            - Register.js
        - nav
            - NavBar.css
            - NavBar.js
        - tickets
            - TicketList.js
            - Tickets.css
        - views
            - ApplicationViews.js
            - Authorized.js
        - Repairs.css
        - Repairs.js
  index.js
```

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

    You can now view honey in the browser.

      Local:            http://localhost:3000
      On Your Network:  http://192.168.68.105:3000

    Note that the development build is not optimized.
    To create a production build, use npm run build.

    webpack compiled successfully
    ```

If these two things do not happen, call in an instructor. Otherwise, move on to the next chapter.