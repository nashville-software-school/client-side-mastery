```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/react-redesign/book-5-honey-rae-repairs/chapters/scripts/repair-auth.sh)"
```

Logout NavBar item
```jsx
{localStorage.getItem("honey_user") ? (
  <li className="navbar-item navbar-logout">
    <Link
      className="navbar-link"
      to=""
      onClick={() => {
        localStorage.removeItem("honey_user")
        navigate("/", { replace: true })
      }}
    >
      Logout
    </Link>
  </li>
) : (
  ""
)}
```

Tickets.css
```css
.btn-container {
  display: flex;
  justify-content: flex-end;
}
```

## && Operator
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND

## Prop Drilling

Want to make that ternary a little cleaner?
Explain the && operator