# Views for Thorns and Roses

## Setup

You need the React Router package installed for this application. Run this command in the root directory of your project.

```sh
npm i --save react-router-dom@5.3
```

## Instructions

In this chapter, you must create a **`NavBar`** component that has `<Link/>` components for the following views.

1. Nurseries
1. Distributors
1. Retailers

## Application Views

Also create your **`ApplicationViews`** component and set up a `<Route />` for each URL.

1. `/nurseries`
1. `/distributors`
1. `/retailers`

For now, each one of your routes can specify a fragment until you build the list components.

Example...

```jsx
<Route exact path="/nurseries">
    <></>
</Route>
```