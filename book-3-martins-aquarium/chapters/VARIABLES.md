# Variable types in JavaScript

In JavaScript, variables store values, and those values can be categorized into **primitive types** and **reference types**. The key difference between them is **how they are stored and accessed in memory**.

### **1. Primitive Types**

#### **Types of Primitive Values**
- `string` → `"hello"`
- `number` → `42`
- `boolean` → `true`
- `null` → `null`

#### **How They Work**
When you assign a primitive value to a variable, JavaScript **stores the value directly in the variable**.

```js
let x = 10;
let y = x; // y gets a COPY of x

x = 20;  // Changing x does NOT affect y

console.log(x); // 20
console.log(y); // 10
```

Each primitive variable operates **independently**, since they hold **separate copies** of the data.

### **2. Reference Types**
Reference values are **mutable objects** stored in a different type of memory called **heap memory**, and variables **hold references (pointers) to the memory location**.

#### **Examples of Reference Types**
- `Object` → `{ name: "Alice" }`
- `Array` → `[1, 2, 3]`
- `Function` → `function() {}`

#### **How They Work**
When you assign a reference type to a variable, JavaScript **stores a reference (memory address), not the actual value**.

```js
let obj1 = { name: "Alice" };
let obj2 = obj1; // obj2 holds a reference to obj1

obj1.name = "Bob"; // Changing obj1 ALSO changes obj2

console.log(obj1.name); // "Bob"
console.log(obj2.name); // "Bob" (same object)
```

Since both `obj1` and `obj2` point to the **same memory location**, changing one affects the other.

### **Example of Comparison Differences**

Copy the code below into a new file called `sandbox.js` in your editor, save and  and run the file from the terminal as `node sandbox.js` and answer the questions below the code snippet.

```js
let a = 10;
let b = 10;
console.log("a equals b: ", a === b);
```

#### Question 1: 
Do you expect to a see "a equals b: true" OR "a equals b: false" in your terminal? 
Why is this the case?

Copy the code below into a new file called `sandbox1.js` in your editor, save and  and run the file from the terminal as `node sandbox1.js` and answer the questions below the code snippet.

```js
let objA = { name: "Alice" };
let objB = { name: "Alice" };
console.log("objA equals objB: " objA === objB);
```

#### Question 2: 
Do you expect to a see "objA equals objB: true" OR "objA equals objB: false" in your terminal? 
Why is this the case?

### Additional resources

[video guide: Reference Vs Value In JavaScript](https://www.youtube.com/watch?v=-hBJz2PPIVE)

[article: Primitive and Reference value in JavaScript](https://www.geeksforgeeks.org/primitive-and-reference-value-in-javascript/)

