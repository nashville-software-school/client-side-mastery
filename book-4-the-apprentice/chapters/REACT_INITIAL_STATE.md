# React Components Initial State


```js
    constructor (props) {
        super(props)

        // Create a new instance of the generator
        this.uuid = this.uuidGenerator()

        // Define initial state
        this.state = {
            contactList: [],
            remoteURL: "http://localhost:5000/contacts",
            contactLoadingMsg: "Loading contacts...",
            loadingClassName: "alert alert-info"
        }
    }

    loadContacts () {
        fetch(this.state.remoteURL).then(r => r.json()).then(contacts => {
            setTimeout(() => {
                this.setState({
                    contactList: contacts,
                    contactLoadingMsg: "",
                    loadingClassName: ""
                })
            }, 3000)
        })
    }

    componentDidMount() {
        this.loadContacts()
    }
```