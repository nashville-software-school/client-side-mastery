# Populating React Component State from an API

One of the lifecycle methods available to every React component is [componentDidMount](https://reactjs.org/docs/react-component.html#the-component-lifecycle). Straight from their docs (emphasis mine):

> `componentDidMount()` is invoked immediately after a component is mounted. Initialization that requires DOM nodes should go here. _If you need to load data from a remote endpoint, this is a good place to instantiate the network request._

The `componentDidMount()` hook runs after the component output has been rendered to the DOM, so if your component needs API data, that is the place to do it. Here's an example.


```js
class ContactList extends Component {
    constructor (props) {
        super(props)

        /*
            Used for Contact component keys. Read the docs
            for more info.

            https://reactjs.org/docs/reconciliation.html#keys
        */
        this.contactCardKey = 1

        // Define initial state
        this.state = {
            contactList: []
        }
    }

    // Get all contacts from the API
    loadContacts () {
        fetch("http://localhost:5000/contacts")
            .then(r => r.json())
            .then(contacts => {
                this.setState({
                    contactList: contacts
                })
            })
    }

    componentDidMount() {
        this.loadContacts()  // Trigger the loading of contacts
    }

    render() {
        return (
            <div className="contactlist">
                {this.state.contactList.map(c => (
                    <div key={this.contactCardKey++}>
                        <div>{c.firstName} {c.lastName}</div>
                    </div>
                ))}
            </div>
        );
    }
}

export default ContactList;
```

## Practice

Now it's time to take your personal data and expose it through an API with `json-server`. Create a `personal.json` file in your project with a `people` collection. Put your information in that collection.

```json
{
    "people": [
        {
            // Your properties go here
        }
    ]
}
```

Start your API with the following command.

```sh
json-server -p 8088 -w personal.json
```

Update your personal component to retrieve the information from the API, and when it is received, update the state of your component.

