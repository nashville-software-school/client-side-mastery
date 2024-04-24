# Getting Started with React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and it doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with JavaScript modules
1. Updating the DOM with document elements or string templates
1. Setting the state of a component

## Creating the Application

Run the following commands _one at a time_ to do the basic software package installations

```sh
cd ~/workspace
npm create vite@latest honey-rae-repairs -- --template react
cd honey-rae-repairs
npm install
```
## Project Setup

We are giving you some boilerplate (starter) code that you will then customize as you build out the Honey Rae Repairs application with React. Run the following command in your terminal.

<!-- TODO: Change this link to cohort 66 branch -->

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/repair-setup.sh)"
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
npm run dev
```

The process of building your React application will begin and the following things will happen.

1. You will see the following message in your terminal.
    ```sh
      ➜  Local:   http://localhost:5173/
      ➜  Network: use --host to expose
      ➜  press h + enter to show help
    ```
1. Navigate to http://localhost:5173/ in your browser
2. In your browser the app should be running with no errors and you should see this welcome page:
   <img src="./images/welcome.png" width="700" />

If these three things do not happen, call in an mentor. Otherwise, move on to the next chapter.

## Backup to Github

Make sure you create a repository on your Github account for your app, and hook up the `honey-rae-repairs` directory. As you work through these chapters, regularly push up to Github.

Up Next: [Your First Component](./REPAIR_FIRST_COMPONENT.md)