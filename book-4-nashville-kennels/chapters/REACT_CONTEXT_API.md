# React Context API for Managing Properties

To avoid passing properties down through child components that aren't using them, other than to pass them down yet again to other child components, you can use the Context API in React to have a component whose sole purpose is to store the data for your application, and then any component can be written to subscribe to the data store.

## Without Context API

Remember the political candidate exercise back when you were using JavaScript modules when figuring out how to join related data collections? Let's revisit that and see how we can build the DOM component with React.

Here's the final HTML structure of a database that contains 2 politicians. Each politician sponsors two bills. Each bill has three interests that it legislates.

```html
<article class="politician">
    <header class="politician__name">
        <h1>Abby Fleming</h1>
    </header>
    <section class="politician__bills">
        <h3>Sponsored Bills</h3>
        <div>
            <h4>S. 2325: Northern Mariana Islands U.S. Workforce Act</h4>
            <ul>
                <li>Employment</li>
                <li>Energy</li>
                <li>Natural Resources</li>
            </ul>
        </div>
    </section>
    <section class="politician__influencers">
        <h3>Related PACs</h3>
        <ul>
            <li>American Gas Association</li>
            <li>League of Conservation Voters Action Fund</li>
        </ul>
    </section>
</article>
````

Here's a tree displaying how React components would be built to produce that final structure.

![dom tree for politician and the bills](./images/honest-abe-dom-tree.png)

That's a complex DOM structure that you would need to build with React components. Then imagine that all of the state for this application gets loaded in the **`PoliticianList`** component. All data that each child component needs, no matter how deeply that component is nested in the tree, needs to keep trickling down the property waterfall until it finally gets to the component that needs it.

```js

class PoliticianList extends Component {
  state = {
      politicians: [
          { id: 1, name: "Madeline Power"},
          { id: 2, name: "Anulfo Ordaz"}
      ],
      sponsoredBills: [
          { id: 1, politicianId: 1, billId: 4},
          { id: 2, politicianId: 1, billId: 1},
          { id: 3, politicianId: 2, billId: 3},
          { id: 4, politicianId: 2, billId: 2}
      ],
      bills: [
          { id: 1, name: "A"},
          { id: 2, name: "B"},
          { id: 3, name: "C"},
          { id: 4, name: "D"}
      ],
      interests: [
          { id: 1, name: "Health Care"},
          { id: 2, name: "Infrastructure"},
          { id: 3, name: "Finance"},
          { id: 4, name: "Medicaid"},
          { id: 5, name: "Education"}
      ],
      billInterests: [
          { id: 1, billId: 4, interestId: 4},
          { id: 2, billId: 4, interestId: 3},
          { id: 1, billId: 3, interestId: 5},
          { id: 2, billId: 3, interestId: 1},
          { id: 3, billId: 3, interestId: 2},
          { id: 4, billId: 2, interestId: 4},
          { id: 5, billId: 2, interestId: 2},
          { id: 6, billId: 2, interestId: 3},
          { id: 7, billId: 1, interestId: 3},
          { id: 8, billId: 1, interestId: 1},
          { id: 9, billId: 1, interestId: 4}
      ]
  }

  render() {
      return (
          <div>
              {
                  this.state.politicians.map(crook =>
                  <Politician key={crook.id}
                      info={crook}
                      billInterests={this.state.billInterests}
                      sponsoredBills={this.state.sponsoredBills}
                      interests={this.state.interests}
                      bills={this.state.bills} />
                  )
              }
          </div>
      )
  }
}

/*
  This component doesn't use, or care about, the interests
  or billInterests tables. However, since a child component
  will need them, they need to be passed through this component
*/
class Politician extends Component {
  render() {
      const myBills = this.props.sponsoredBills
      .filter(sb => sb.politicianId === this.props.info.id )
      .map(sb => this.props.bills.find(b => b.id === sb.billId ) )
      return (
          <div>
              <h2>{this.props.info.name}</h2>
              <BillList
                  billInterests={this.props.billInterests}
                  interests={this.props.interests}
                  bills={myBills} />
          </div>
      )
  }
}

/*
  This component also doesn't use, or care about, the interests
  or billInterests tables. However, since a child component
  will need them, they need to be passed through this component
*/
class BillList extends Component {
  render() {
      return (
          <div>
                  <h3>Sponsored Bills</h3>
                  <ol>
                  {
                    this.props.bills.map(bill =>
                      <Bill info={bill}
                          key={bill.id}
                          billInterests={this.props.billInterests}
                          interests={this.props.interests} />

                    )
                  }
                  </ol>
          </div>
      )
  }
}

/*
  This component needs to filter the interests table to only
  the ones related to the current Bill and then pass it along
  to the child component
*/
class Bill extends Component {
  render() {
      const myInterests = this.props.billInterests
      .filter(bi =>
          bi.billId === this.props.info.id
      )
      .map(bi =>
        this.props.interests.find(i => i.id === bi.interestId)
      )

      return (
          <li>
              {this.props.info.name}
              <BillInterestList interests={myInterests} />
          </li>
      )
  }
}

/*
  Finally, we iterate of the collection of interests that were
  defined all the way up in the Politician component. It had
  to be passed through three components to make it to where it
  will actually be used.

  This is wasteful, and overly complex.
*/
class BillInterestList extends Component {
  render() {
      return (
          <ul>
          {
            this.props.interests.map(interest =>
              <Interest info={interest} key={interest.id} />
            )
          }
          </ul>
      )
  }
}

class Interest extends Component {
  render() {
      return (
          <li>{this.props.info.name}</li>
      )
  }
}
```

This phenomenon is called **_prop-drilling_**. Passing data through component, after component, after component until it finally gets to one that actually needs it to render some DOM.

Imagine if we need to change the component structure? For example, we could eliminate the **`BillInterestList`** component. The side-effect is that our app now breaks because the data no longer makes it to the **`Interest`** component, which means we would need to refactor the **`Bill`** component.

What a mess.

The **Context API** allows us to have each component pull the data that it needs directly from a central data store, instead of being tightly bound to a parent component and relying on it to receive its data.

To implement this we first create a component whose sole purpose is to store data. It's a data provider.

> data/HonestAbeProvider.js

```js
import React, {Component} from "react"

/*
  This new function in React - createContext() - is what will
  allow you to create a central store of data, and have any
  component become a Consumer of the data that it cares about.
*/
export const Context = React.createContext()

export class Provider extends Component {


    /*
      The initial state of the data provider should include
      default values for any top-level component that will
      need the data. In this case, PoliticianList is my only
      top-level component. It is not a child of any other
      component.
    */
    state = { "politicians": [] }

    /*
        Since this is just an ordinary component that extends
        React.Component, you can use `componentDidMount` to
        hit your API and then update state.
    */
    componentDidMount () {
        fetch("https://nss-kitty-purry.herokuapp.com/db/")
            .then(r => r.json())
            .then(db => {
                this.setState(db)
            })
    }

    /*
        This component will not render any DOM element itself.
        Rather it becomes a virtual wrapper around any component
        that wants to serve as the data provider for its children.
    */
    render () {
        return (
            <Context.Provider value={{
                state: this.state
            }}>
                {this.props.children}
            </Context.Provider>
        )
    }
}
```

Now it's time to set up my **`PoliticianList`** component to be a provider. Note the use of the **`<Provider>`** component that wraps everything. Then a child component of **`<Context.Consumer>`** is created to start consuming data for use in the JSX.

> politician/PoliticianList.js

```js
import React, { Component } from "react"
import { Context, Provider } from "../../data/HonestAbeProvider"
import Politician from "./Politician"

export default class PoliticianList extends Component {
    render() {
        return (
            <Provider>
                <Context.Consumer>
                {
                    context => (
                        <div className="politicianList">
                        {
                            context.state.politicians.map(p => <Politician data={p} key={p.id} /> )
                        }
                        </div>
                    )
                }
                </Context.Consumer>
            </Provider>
        )
    }
}
```

That component renders _n_ number of child **`Politician`** components. Now you can modify that child component to consume a specific part of the provider data.

First name and last name can get pulled from the properties it received from the parent component, but to display the bills, I'm consuming the `politicianlegislation` table from the Provider. They no longer need to be passed down as properties from **`PoliticianList`** component.

> politician/Politician.js

```js
import React, { Component } from "react"
import { Context } from "../../data/HonestAbeProvider"
import Bill from "../Bill"

export default class Politician extends Component {
    render () {
        return (
            <div>
                {this.props.data.name.first} {this.props.data.name.last}
                <ol>
                <Context.Consumer>
                {
                    context =>
                        context.state.politicianlegislations
                        .filter(pl => {
                            return pl.politicianId === this.props.data.id
                        })
                        .map(pl => <Bill id={pl.legislationId} key={pl.id} />)
                }
                </Context.Consumer>
                </ol>
            </div>
        )
    }
}
```

You then follow this pattern for each child, grandchild, great-grandchild, etc. Some data gets passed a properties, but then the child component uses its properties to then query the data provider to get more information.

```js
import React, { Component } from "react"
import { Context } from "../data/HonestAbeProvider"
import "./Bill.css"
import Interest from "./Interest";

export default class Bill extends Component {
    constructor (props) {
        super(props)
        this.key = 1
    }

    render() {
        return (
            <Context.Consumer>
                {context => {
                    const bill = context.state.legislations.find(l => l.id === this.props.id)
                    const billInterests = context.state.legislationinterests.filter(
                        li => li.legislationId === this.props.id
                    )
                    return (
                        <li className="bill">
                            {bill.name}
                            <ul>
                                {billInterests.map(bi => <Interest id={bi.interestId} key={this.key++} /> )}
                            </ul>
                        </li>
                    )

                }}
            </Context.Consumer>
        )
    }
}
```

```js
import React, { Component } from "react"
import { Context } from "../data/HonestAbeProvider"

export default class Interest extends Component {
    render() {
        return (
            <Context.Consumer>
                {context => {
                    const interest = context.state.interests.find(i => i.id === this.props.id)
                    return (
                        <span className="badge badge-light">{interest.name}</span>
                    )

                }}
            </Context.Consumer>
        )
    }
}
```
