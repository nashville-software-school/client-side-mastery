# Many to Many

There are times where two sets of data have a more complex relationship than a simple 1 -> &infin;. Let's look at an example of aggregation where the two entities operate independently of each other, but one can contain many of the other.

Imagine you are defining a database for a family's chore list. Here's a list of chores.

1. Paint the garage
1. Take out the trash
1. Do the laundry
1. Clean the bedrooms
1. Family game night
1. Feed the dog

There are also many family members.

1. Dad
1. Mom
1. Sarah
1. Blake
1. Sophia
1. Michael

> #### `database.json`

```json
{
    "familyMembers": [
        { "id": 1, "name": "Mom" },
        { "id": 2, "name": "Dad" },
        { "id": 3, "name": "Sarah" },
        { "id": 4, "name": "Blake" },
        { "id": 5, "name": "Sophia" },
        { "id": 6, "name": "Michael" }
    ],
    "chores": [
        { "id": 1, "task": "Paint Garage" },
        { "id": 2, "task": "Take out the trash" },
        { "id": 3, "task": "Do the laundry" },
        { "id": 4, "task": "Clean the bedrooms" },
        { "id": 5, "task": "Family game night" },
        { "id": 6, "task": "Feed the dog" }
    ]
}
```


Now, some of the tasks are 1-person jobs, like taking out the trash. Other tasks require more than one person, such as family game night, or painting the garage.

Also, each family member will be assigned more than one task. Dad is responsible for doing the laundry, but also for taking part in family game night.

1. A family member can have many chores
1. Each chore can be assigned to many family members

This is a many-to-many relationship. This will require us to have a data set whose purpose is simply to store those relationships. This allows us maximum flexibility because we can assign any number of family members to a task, and assign any number of tasks to a family member.

The next step is to define an intersection table to store the relationships between family members and chores. In this intersection table definition below, you can see that mom is assigned to two tasks, and dad is also assigned to two tasks.

You can also see that mom and dad are both assigned to the same `taskId` of 5 - which is game night.

You would add the following `familyChores` property to your JSON file.

> #### `database.json`

```json
{
    "familyMembers": [...],
    "chores": [...],
    "familyChores": [
        {
            "id": 1,
            "familyMemberId": 1,
            "choreId": 4
        },
        {
            "id": 2,
            "familyMemberId": 1,
            "choreId": 5
        },
        {
            "id": 3,
            "familyMemberId": 2,
            "choreId": 5
        },
        {
            "id": 4,
            "familyMemberId": 2,
            "choreId": 3
        }
    ]
}
```

The first relationship stores the fact that Mom is going to clean the bedrooms.

The second relationship stores the fact that Mom is going to join family game night.

The third relationship stores the fact that Dad is going to join family game night.

The fourth relationship stores the fact that Dad is going to do the laundry.

## Displaying Chores for Family Members


> ##### `chores/scripts/ChoreProvider.js`

```js
let chores = []

export const useChores = () => chores.slice()

export const getChores = () => fetch("http://localhost:8088/chores")
    .then(res => res.json())
    .then(data => chores = data)
```


> ##### `chores/scripts/FamilyProvider.js`

```js
let people = []

export const useFamilyMembers = () => people.slice()

export const getFamilyMembers = () => fetch("http://localhost:8088/familymembers")
    .then(res => res.json())
    .then(data => people = data)
```

> ##### `chores/scripts/FamilyChoreProvider.js`

```js
let familyChores = []

export const useFamilyChores = () => familyChores.slice()

export const getFamilyChores = () => fetch("http://localhost:8088/familychores")
    .then(res => res.json())
    .then(data => familyChores = data)
```


> ##### `chores/scripts/FamilyList.js`

```js
import { useChores } from "./ChoreProvider.js"
import { useFamilyMembers } from "./FamilyProvider.js"
import { useFamilyChores } from "./FamilyChoreProvider.js"
import { FamilyMember } from "./FamilyMember.js"

const contentTarget = document.querySelector(".family")

export const FamilyList = () => {
    const chores = useChores()
    const people = useFamilyMembers()
    const peopleChores = useFamilyChores()

    const render = () => {
        contentTarget.innerHTML = people.map(person => {
            // Find related chore ids
            let relatedChores = peopleChores.filter(pc => pc.familyMemberId === person.id)

            // Convert the array from relationship objects to chore objects
            relatedChores = relatedChores.map(rc => {
                return chores.find(chore => chore.id === rc.choreId)
            })

            // Get HTML representation of product
            const html = FamilyMember(person, relatedChores)

            return html
        }).join("")
    }

    render()
}
```

> ##### `chores/scripts/FamilyMember.js`

```js
export const FamilyMember = (person, chores) => {
    return `
        <section class="familyMember">
            <header>
                <h2>${person.name}</h2>
            </header>
            <div>
                <ol>
                    ${
                        chores.map(chore => `<li>${chore.task}</li>`).join("")
                    }
                </ol>
            </div>
        </section>
    `
}
```

> ##### `chores/scripts/main.js`

```js
import { getChores } from "./ChoreProvider.js"
import { getFamilyMembers } from "./FamilyProvider.js"
import { getFamilyChores } from "./FamilyChoreProvider.js"
import { FamilyList } from "./FamilyList.js"

getChores()
    .then(getFamilyMembers)
    .then(getFamilyChores)
    .then(FamilyList)
```

It should render the following output

![image of rendered family members and their chores](./images/family-chores.png)