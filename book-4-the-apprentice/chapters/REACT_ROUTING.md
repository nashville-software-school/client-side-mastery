# Routing in React Applications

In a single page application, you are only rendering one DOM tree. You never request another HTML file, but simply create/destroy components in the one you have. If you have multiple views in your application, a universal design pattern is to have a navigation page at the top of the DOM for people to click on to see different views.

In React, you will use something called a Router to handle rendering different components when the user clicks on navigation items.

## Setup

Make sure you are in your `src` directory.

```sh
npm install react-router-dom
mkdir nav
touch nav/NavBar.js
touch nav/NavBar.css
```

Your `index.js` is going to change. Up to this point, you've rendered your personal component right onto the DOM, but we now need to add a navigation bar.

Before we render our NavBar, let's make a component for it.

> nav/NavBar.js

```js
import React, { Component } from "react";
import { Link } from "react-router-dom";
import "./NavBar.css"


class NavBar extends Component {
    render() {
        return (
            <nav>
                <Link to="/">Home</Link>
            </nav>
        );
    }
}

export default NavBar;
```

You'll notice the use of the new `<Link/>` component that you get from the React Router package you installed. It has an attribute named `to`. It will render a hyperlink in your DOM, and when clicked, it will change the URL in the browser to the value of the `to` attribute.

Now you can update your `index.js` and its root component must now be `<Router />` which gets imported from the React Router package. In that router, we load our new mavigation bar, and specify all of the routes that we want configured for our application.

For now, you're going to define a `<Route />` component for every `<Link/>` component that you defined in your navigation bar above.


> index.js

```js
import { BrowserRouter as Router, Route } from "react-router-dom";
import NavBar from "./nav/NavBar";


ReactDOM.render((
    <Router>
        <div>
            <NavBar/>
            <Route exact path="/" component={Hannah} />
        </div>
    </Router>
), document.querySelector("#root"))
```

When the page reloads, you will see your navigation bar, and your personal component will be rendered automatically since you are on the `/` route by default.

## Adding another Route

You're going to add another view in this application to list the projects that you've worked on in the client side course.

> projects/Project.js

```js
import React, { Component } from "react"


class Project extends Component {
    render() {
        return (
            <article>
                <div>{ this.props.project.name }</div>
                <div>{ this.props.project.description }</div>
            </article>
        )
    }
}

export default Project
```

> projects/ProjectList.js

```js
import React, { Component } from 'react'
import Project from './Project'


class ProjectList extends Component {

    constructor (props) {
        super(props)
        let uniqueKey = 1
    }

    state = {
        projectList: []
    }

    componentDidMount() {
        fetch("http://localhost:5000/projects")
            .then(r => r.json())
            .then(contacts => {
                    this.setState({
                        contactList: contacts
                    })
            })
    }

    render() {
        return (
            <div className="projectList">
                {this.state.contactList.map(project => (
                    <Project name={project.firstName}
                             description={project.lastName}
                             key={this.uniqueKey++} />
                ))}
            </div>
        )
    }
}

export default ProjectList
```


```js
import { BrowserRouter as Router, Route } from "react-router-dom";
import NavBar from "./nav/NavBar";
import ProjectList from "./projects/ProjectList"
import Hannah from "./Hannah"


ReactDOM.render((
    <Router>
        <div>
            <NavBar/>
            <Route exact path="/projects" component={ProjectList} />
            <Route exact path="/" component={Hannah} />
        </div>
    </Router>
), document.querySelector("#root"))
```



## Practice

Create a navigation bar for your application with three links in it.

1. Home
1. Projects
1. About Me

The home page should display the following information.

1. Your name
1. List of technologies you've learned so far

The projects page should list the name and a link to the repo for each group project that you've worked on so far.

The about me page should display any other interesting information about yourself that you want others to know.

1. Favorite frogs
1. Places you've traveled
1. Comic book collection

etc...