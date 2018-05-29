# React Context API for Managing Properties

To avoid passing properties down through child components that aren't using them, other than to pass them down yet again to other child components, you can use the Context API in React to have a component whose sole purpose is to store the data for your application, and then any component can be written to subscribe to the data store.

## Without Context API

Consider that you are writing React components for a dog kennel business, with multiple locations, to display the locations and which dogs are currently being boarded in each.

```js
import React, { Component } from "react"

class KennelList extends Component {
    state = {
        customers: [
            { id: 1, name: "Michael Tambornino", dogId: 3 },
            { id: 2, name: "Anulfo Ordaz", dogId: 2 },
            { id: 3, name: "Madeline Power", dogId: 4 },
            { id: 4, name: "Jack Mocherman", dogId: 1 }
        ],
        dogs: [
            { id: 1, name: "Rover", breed: "Lab" },
            { id: 2, name: "Badger", breed: "German Shepherd" },
            { id: 3, name: "Jack", breed: "Bulldog" },
            { id: 4, name: "Ranger", breed: "Terrier" }
        ],
        kennels: [
            {
                id: 1,
                name: "Nashville North",
                dogs: [ 1, 4 ]
            },
            {
                id: 2,
                name: "Nashville South",
                dogs: [ 3, 2 ]
            }
        ]
    }

    render() {
        return (
            <div>
                {this.state.kennels.map(kennel => (
                    <Kennel key={kennel.id} info={kennel} dogs={this.state.dogs} />
                ))}
            </div>
        )
    }
}

class Kennel extends Component {
    render() {
        return (
            <div>
                <h3>{this.props.info.name}</h3>
                {this.props.info.dogs.map(dogId => {
                    const dogObject = this.props.dogs.find(dog => {
                        return dog.id === dogId
                    })
                    return <Dog key={dogObject.id} info={dogObject} />
                })}

            </div>
        )
    }
}

class Dog extends Component {
    render() {
        return (
            <div>
                {this.props.info.name} the {this.props.info.breed}
            </div>
        )
    }
}
```
