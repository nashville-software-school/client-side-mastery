# Searching Animals

Right now, the list of animals just displays the entire state of animals in your application. In this chapter, you are going to be introduced to working with component state, which may be different than the application state or the API state.

You are going to implement a search feature where you can type in letters into a **`SearchBar`** component, and a sibling **`SearchResults`** component will display any animals that contain the letters you enter in. This means that the state of the **`SearchResults`** component will be different than the state of the application or API. It could only display 2 animals, whereas there are 20 animals total.

## Create a Search Bar Component

##### **`src/components/search/SearchBar.js`**

```jsx
import React, { useRef } from "react"

export const SearchBar = ({ setTerms }) => {

    const { terms } = useRef()

    return (
        <fieldset>
            <div className="form-group">
                <label htmlFor="searchTerms">Search:</label>
                <input onKeyUp={ e => setTerms(e.target.value) }
                    type="text"
                    id="searchTerms"
                    ref={terms}
                    required
                    autoFocus
                    className="form-control"
                />
            </div>
        </fieldset>
    )
}
```

## Create a Search Results Component

##### **`src/components/search/SearchResults.js`**

```jsx
import React, { useState, useContext, useEffect } from "react"
import { AnimalContext } from "../animal/AnimalProvider"

export const SearchResults = ({ searchTerms }) => {
    const { animals } = useContext(AnimalContext)
    const [ filteredAnimals, setFiltered ] = useState([])

    useEffect(() => {
        if (searchTerms !== "") {
            const subset = animals.filter(animal => animal.name.toLowerCase().includes(searchTerms))
            setFiltered(subset)
        } else {
            setFiltered([])
        }
    }, [searchTerms, animals])

    return (
        <div className="searchResults">
            <h3>Results</h3>
            <div className="animals">
                {
                    filteredAnimals.map(animal => <div key={ animal.id }>{ animal.name }</div>)
                }
            </div>
        </div>
    )
}
```


## Update Dashboard to Include Search

##### **`src/components/Dashboard.js`**

```jsx
import React, { useState } from "react"
import { LocationProvider } from "./location/LocationProvider"
import LocationList from "./location/LocationList"
import { EmployeeProvider } from "./employee/EmployeeProvider"
import EmployeeList from "./employee/EmployeeList"
import { AnimalProvider } from "./animal/AnimalProvider"
import AnimalList from "./animal/AnimalList"
import { CustomerProvider } from "./customer/CustomerProvider"
import CustomerList from "./customer/CustomerList"
import { SearchBar } from "./search/SearchBar"
import { SearchResults } from "./search/SearchResults"
import "./Layout.css"

export default () => {
    const [searchTerms, setTerms] = useState(null)

    return (
        <div className="mainContainer">
            <AnimalProvider>
                <CustomerProvider>
                    <EmployeeProvider>
                        <LocationProvider>
                            <div className="searchContainer">
                                <SearchBar setTerms={setTerms} />
                                <SearchResults searchTerms={searchTerms} />
                            </div>
                            <div className="dataContainer">
                                <h2>Nashville Kennels</h2>
                                <small>Loving care when you're not there.</small>
                                <LocationList />
                                <AnimalList />
                                <CustomerList />
                                <EmployeeList />
                            </div>
                        </LocationProvider>
                    </EmployeeProvider>
                </CustomerProvider>
            </AnimalProvider>
        </div>
    )
}
```

## Add Flexbox Styling for App Layout

##### **`src/components/Layout.css`**

```css
.mainContainer {
    display: flex;
    flex-direction: row;
    padding: 0.75rem;
}

.searchContainer {
    display: flex;
    flex-direction: column;
    flex: 1;
    padding: 2rem;
}

.dataContainer {
    padding: 2rem;
    flex: 4;
}
```
