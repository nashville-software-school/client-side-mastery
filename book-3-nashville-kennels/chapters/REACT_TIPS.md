# React Tips and Tricks

#### Debugging in JSX

```jsx
return(
    <>
        {
            console.log(variable) && <h1>Hello World</h1>
        }
    </>
)
```

#### Inline Styling

```jsx
<h3>Name: <span style={{color: 'darkslategrey'}}>Doodles</span></h3>

```

#### Ternary Expressions

```jsx
  <div>
      {
          animal.owners.length < 2
            ? <p>Animal can have one more owner</p>
            : <p>Animal has enough owners</p>
      }
  </div>
```



