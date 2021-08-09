# Getting Started with React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and it doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with JavaScript modules
1. Updating the DOM with document elements or string templates
1. Setting the state of a component

## Installing React Developer Tools

You can install the React Developer Tools via the [Chrome Store](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi). These tools are another panel the Chrome Developer panel that will help with debugging and inspecting your React applications.

## Getting Started with create-react-app

```sh
cd ~/workspace
npx create-react-app kennels
# Wait for installation to complete
cd kennels/src
rm App*
```

### Getting Setup

Before we grow this application, let's create a meaningful directory structure.

1. Inside your `src` directory, `mkdir` a `components` sub-directory.
2. `cd` into the `components` directory.
3. `touch` `Kennel.js` and `Kennel.css`.
4. Within components, `mkdir` an `animal` directory
5. `cd` into the `animal` directory.
6. `touch AnimalCard.js Animal.css`

```
- src
    - components
        - animal
            - AnimalCard.js
            - Animal.css
        - Kennel.js
        - Kennel.css
  index.js

```
