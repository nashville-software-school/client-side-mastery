# REACT TIPS

A few cool code snippets and shortcuts.


```jsx
render() {
    const {error, jokeLoaded, objResult, showResult} = this.state;

    return (
        null
    )

}
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
      {this.state.loadingStatus
          ? <p>App is loading</p>
          : <p>App is done loading</p>
      }
  </div>
```



