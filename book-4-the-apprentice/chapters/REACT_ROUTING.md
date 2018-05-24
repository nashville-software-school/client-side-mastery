# Routing in React Applications

```sh
npm install react-router-dom
```

> nav/NavBar.js

```js
import React, { Component } from "react";
import { Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "../NavBar.css"


class NavBar extends Component {
    render() {
        return (
            <nav className="nav nav-pills nav-justified">
                <Link className="nav-link" to="/new">New Contact</Link>
                <Link className="nav-link" to="/">List Contacts</Link>
            </nav>
        );
    }
}

export default NavBar;
```

> index.js

```js
import { BrowserRouter as Router, Route } from "react-router-dom";
import NavBar from "./nav/NavBar";


ReactDOM.render((
    <Router>
        <div>
            <NavBar/>
            <Route exact path="/new" component={ContactForm} />
            <Route exact path="/" component={ContactList} />
        </div>
    </Router>
), document.querySelector("#root"))
```
