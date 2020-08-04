# Listing Facilities per Criminal


To get the facilities in which each criminal spent time during their incarceration, it's a two-step process to traverse the data.

1. You start with iterating the criminals array.
1. For each criminal, filter the `criminalFacilities` array down to the entries that the current criminal.
1. From **that** array, get the corresponding facility objects.

## Setup

### Facility Provider

First, set up a **`FacilityProvider`** component with the following code.

> **`scripts/facility/FacilityProvider.js`**

```js
let facilities = []

export const useFacilities = () => facilities.slice()

export const getFacilities = () => {
   return fetch("https://criminals.glassdale.us/facilities")
    .then(response => response.json())
    .then(apiData => {
        facilities = apiData
    })
}
```

### Criminal Facilities Relationship Provider

Next, a provider for the relationship data between criminals and facilities.

> **`scripts/facility/CriminalFacilityProvider.js`**

```js
let criminalFacilities = []

export const useCriminalFacilities = () => {
    return criminalFacilities.slice()
}

export const getCriminalFacilities = () => {
    return fetch("http://localhost:8088/criminalFacilities")
        .then(response => response.json())
        .then(apiData => {
            criminalFacilities = apiData
        })
}
```

## Showing Facilities Per Criminal

You want each criminal card in your UI to now show the facilities in which time was spent. This means that the **`Criminal`** component must be modified to show the new HTML representations, and the **`CriminalList`** component must be updated to get the data.

### Get Data Before Rendering

As the code stands right now, the operation of getting the criminal data is invoked in `main.js` because several components need that data before rendering _(criminal list, notes list, and note form)_. However, the criminal list is the only component that needs information about the facilities, so you will add the code in that component to get the data.

> **`scripts/criminal/CriminalList.js`**

```js
export const CriminalList = () => {
    // Kick off the fetching of both collections of data
    getFacilities()
        .then(getCriminalFacilities)
        .then(
            () => {
                // Pull in the data now that it has been fetched
                const facilities = useFacilities()
                const crimFac = useCriminalFacilities()
                const criminals = useCriminals()

                // Pass all three collections of data to render()
                render(criminals, facilities, crimFac)
            }
        )
}
```

### Updated Rendering

> **`scripts/criminal/CriminalList.js`**

```js
const render = (criminalsToRender, allFacilities, allRelationships) => {
    // Step 1 - Iterate all criminals
    contentTarget.innerHTML = criminalsToRender.map(
        (criminalObject) => {
            // Step 2 - Filter all relationships to get only ones for this criminal
            const facilityRelationshipsForThisCriminal = allRelationships.filter(cf => cf.criminalId === criminalObject.id)

            // Step 3 - Convert the relationships to facilities with map()
            const facilities = facilityRelationshipsForThisCriminal.map(cf => {
                const matchingFacilityObject = allFacilities.find(facility => facility.id === cf.facilityId)
                return matchingFacilityObject
            })

            // Must pass the matching facilities to the Criminal component
            return Criminal(criminalObject, facilities)
        }
    ).join("")
}
```

### Facilities HTML Representation in Criminal Component

There is a new `<div>` element in the criminal HTML representation that uses the `map()` array method to convert each facility object to a facility HTML representation.

Be aware that this is all highly abstract code that will push your ability to visualize the data flow to **the extreme**!!

You are going to pattern match how to write code for a many-to-many relationship for quite a while. Doing this from scratch requires a neural rewiring that takes much longer than your time here at NSS.

```js
export const Criminal = (criminalObject, facilities) => {
    return `
    <div class="criminal">
        <h4>${criminalObject.name}</h4>
        <div class="criminal__details">
            <p>Convicted for ${criminalObject.conviction}</p>
            <p>Arrested by ${criminalObject.arrestingOfficer}</p>
            <p>Incarcerated between:
                ${new Date(criminalObject.incarceration.start).toLocaleDateString()} and
                ${new Date(criminalObject.incarceration.end).toLocaleDateString()}
            </p>
            <p>Age: ${criminalObject.age}</p>
            <div>
                <h2>Facilities</h2>
                <ul>
                    ${facilities.map(f => `<li>${f.facilityName}</li>`).join("")}
                </ul>
            </div>
            <button id="associates--${criminalObject.id}">Show Associates</button>
        </div>
    </div>
    `
}
```


