# Shallow vs Deep copies

*Note* The issue we are discussing in this chapter (deep vs shallow copy) does not affect **primitive values** because they are stored directly in a variable and copied **by value**, meaning modifications to one variable do not impact another.

### **Childcare Module: Deep vs. Shallow Copies**
In a childcare , we need to maintain a **secure list of children** and control how others can access and modify this data. 

#### When sharing data:
- **No Copy** : Returning or assigning an object/array directly means no new object is created, both variables point to the same reference in memory, changes affect the original.
- **Shallow copies** create a new object, but its nested objects are still linked to the original.
- **Deep copies** create a completely independent clone.

#### **Common Copy Methods**
| Copy Type       | Method(s)                                      | Notes |
|----------------|--------------------------------|------|
| **Shallow Copy** | `Array.prototype.slice()`, `Array.from()`, `[...array]`, `Object.assign()` | Only copies top-level values. Nested objects remain linked. |
| **Deep Copy** | `JSON.parse(JSON.stringify(obj))`, `structuredClone(obj)` | Creates a true independent copy. `structuredClone` is the preferred method. |

Create a files in the same directory, childcare.mjs noCopy.mjs shallowCopy.mjs deepCopy.mjs and run it in Node as `node noCopy.mjs` etc..

### **`childcare.mjs`** (Module)
```javascript
const children = [
  { name: "Emma", age: 5 },
  { name: "Liam", age: 4 }
];

export function getChildrenNoCopy() {
  return children; // No copying!
}

export function getChildrenShallowCopy() {
  return [...children]; // Shallow copy
}

export function getChildrenDeepCopy() {
  return structuredClone(children); // Deep copy
}
```


### **`noCopy.mjs`** (No Copy Example)
```javascript
import { getChildrenNoCopy } from "./childcare.mjs";

let caregiverChildren = getChildrenNoCopy();

caregiverChildren[0].age = 6; // Modifying Emma's age
caregiverChildren.push({ name: "Noah", age: 3 }); // Adding a new child

console.log("Original Children List:", getChildrenNoCopy());
console.log("Caregiver's List:", caregiverChildren);

```

#### Question: Why did changes made by the caregiver also affect the original list of children?

### **`shallowCopy.mjs`** (Shallow Copy Example)
```javascript
import { getChildrenShallowCopy } from "./childcare.mjs";

let caregiverChildren = getChildrenShallowCopy();

caregiverChildren[0].age = 6; // Modifying Emma's age

console.log("Original Children List:", getChildrenShallowCopy());
console.log("Caregiver's Copy:", caregiverChildren);

```
#### Question: Why did changing the `age` of a child in the caregiver’s list also modify the original list?

### **`deepCopy.mjs`** (Deep Copy Example)
```javascript
import { getChildrenDeepCopy } from "./childcare.mjs";

let caregiverChildren = getChildrenDeepCopy();

caregiverChildren[0].age = 6; // Modifying Emma's age

console.log("Original Children List:", getChildrenDeepCopy());
console.log("Caregiver's Copy:", caregiverChildren);

```
#### Question: Why did modifying the caregiver’s list not affect the original list this time?