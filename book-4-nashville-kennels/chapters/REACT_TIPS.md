# REACT TIPS

A few cool code snippets and shortcuts.

"Destructure" props passed to a component

```jsx
const ApplicationViews = ({hasUser, setUser}) => {

// ....

};
```

React.Fragment Shortcut

```jsx
<>
  <h1>Hello World</h1>
  <p>This is a great idea</p>
</>
```

Inline Style

```jsx
<h3>Name: <span style={{color: 'darkslategrey'}}>Doodles</span></h3>

```

Ternary Expressions

```jsx
  <div>
      {isLoading
          ? <p>App is loading</p>
          : <p>App is done loading</p>
      }
  </div>
```
