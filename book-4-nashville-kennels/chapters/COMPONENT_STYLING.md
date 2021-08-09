# Modular CSS for React Components

One amazing thing about React is that you can directly import the stylesheet that is needed any components in that module.

> bio.css

```css
.bio {
    margin-top: 10px;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    padding: 0 5px 5px 5px;
    background-color: whitesmoke;
}

.bio__occupation {
    line-height: 1.5em;
}

.bio__longtext {
    font-size: smaller;
}
```

> Bio.js

```js
import React, { Component } from 'react'
import "./bio.css"  // Import classes for this component


/*
    Bio itself has no state since the Hannah component
    will be sending it all the data it needs as props
*/
class Bio extends Component {
    render() {
        return (
            <div class="bio">
                <p class="bio__occupation">
                    Occupation: {this.props.occupation}
                </p>
                <p class="bio__longtext">
                    Bio: {this.props.bio}
                </p>
            </div>
        )
    }
}


export default Bio
```

> person.css

```css
.person {
    border: 1px solid gray;
    border-radius: 5px;
    margin: 5px;
}
```

> Hannah.js

```js
import React, { Component } from 'react'
import Bio from "./Bio"
import "./person.css"


class Hannah extends Component {
    constructor (props) {
        /*
            This is needed to properly initialize a React
            component if you define a constructor
        */
        super(props)

        // Set the initial state of the component
        this.state = {
            firstName: "Hannah",
            lastName: "Hall",
            occupation: "Software Engineer",
            bio: "Graduated NSS in cohort 13. Junior instructor as NSS for one year. Now kicking ass professionally."
        }
    }

    // Occupation and bio now sent to Bio as properties
    render() {
        return (
            <article class="person">
                <h2>{this.state.firstName} {this.state.lastName}</h2>
                <Bio occupation={this.state.occupation} bio={this.state.bio} />
                </button>
            </article>
        )
    }
}

export default Hannah
```

## Practice

Create a CSS file for each of your components and import them into the corresponding component module.
