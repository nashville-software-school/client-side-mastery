# Powerful Object Creation in JavaScript

## Key Concept

* Objects represent things we need to display, or use, in our application
* Properties describe the objects
* Methods define their behavior

## Actor

What do I mean by actor? To understand that, let's look at the definition of one of the core principles that professional software developers use to build flexible, scalable, maintainable systems - the Single Responsiblity Principle [SRP]. It's part of the collection of  SOLID principles.

You need to read the [SOLID: Part 1](https://code.tutsplus.com/tutorials/solid-part-1-the-single-responsibility-principle--net-36074) article which covers the SRP and the term *Actor*.

## Using the Power of Object.create()

Up to this point, we've been using the simplistic method for creating objects, which gives us no power, or control, on how it gets manipulated.

```js
const boringObject = {}
```

Now you're going to learn about `Object.create()`, and once you see how much power it gives you, you will start to understand how it can help you comply with the SRP.

![realize the power](images/object-create-realize.gif)

> *The moment when a JavaScript developer realizes the true power of Object.create()*

### Read Only Properties

When you use `{}` to create an object, you have zero control how properties are created, deleted, or changed. Here's an object with very sensitive data in it.

```js
const veryImportantInfo = {
    "socialSecurity": "934-11-0201",
    "bankAccountNumber": "4483271255",
    "bankRoutingNumber": "458979043"
}
```

Another developer on your team is tasked with using that object in her code, so she writes a function for that purpose.

```js
const requestFunds = function (customerInfo) {
    // Note: Banks require that the account number and routing number be combined into a single value
    customerInfo.bankAccountNumber = customerInfo.bankAccountNumber + customerInfo.bankRoutingNumber
    const transactionInfo = customerInfo.bankAccountNumber

    // Awesome code that performs the transaction goes here...
}
```

The requirements she got for her feature required that the account number and the routing number be combined into a single string for the transaction to be successful. So while her code works perfectly fine, she inadvertantly modified YOUR OBJECT! It wasn't malicious, just a standard bug introduced when a developer isn't focused.

```js
const requestFunds = function (customerInfo) {
    // Note: Banks require that the account number and routing number be combined into a single value
    customerInfo.bankAccountNumber = customerInfo.bankAccountNumber + customerInfo.bankRoutingNumber
    const transactionInfo = customerInfo.bankAccountNumber

    // Awesome code that performs the transaction goes here...
}

const veryImportantInfo = {
    "socialSecurity": "934-11-0201",
    "bankAccountNumber": "4483271255",
    "bankRoutingNumber": "458979043"
}

requestFunds(veryImportantInfo)

console.log(veryImportantInfo.bankAccountNumber)   // 4483271255458979043 --> Yikes!
```

![panic!](./images/panic.gif)

Using the power of `Object.create()` you can prevent another developer from changing the value of any property on an object. The create method allows you to specify whether a property can be changed with the `writable` property. By setting it to false, that value cannot be changed. It is now a read-only property.

```js
const veryImportantInfo = Object.create(null, {
    socialSecurity: {
        value: "934-11-0201",
        writable: false
    },
    bankAccountNumber: {
        value: "4483271255",
        writable: false
    },
    bankRoutingNumber: {
        value: "458979043",
        writable: false
    }
})

veryImportantInfo.socialSecurity = "haxx0r attack"
console.log(veryImportantInfo.socialSecurity)    // 934-11-0201  --> It didn't change!
```

The `writable` property is actually `false` by default, so if you want it to be read-only, you can just leave it off of the property definition.

```js
const veryImportantInfo = Object.create(null, {
    socialSecurity: {
        value: "934-11-0201"
    },
    bankAccountNumber: {
        value: "4483271255"
    },
    bankRoutingNumber: {
        value: "458979043"
    }
})
```

Try it out for yourself. Create a new Quokka file, paste the above object into it, and try to change one of the property values of `veryImportantInfo`. You can't!

![read only properties](./images/NOmZNJeNBT.gif)

### Hidden(ish) Properties

When you use a `for..in` loop to iterate over the keys of an object, only enumerable keys will be used. Let's see what that means. If you open a Quokka file and create an object using curly braces, and then iterate over its keys, nothing will appear.

```js
const boring = {}

for (let key in boring) {
    console.log(key)
}

// ... nothing appears
```

Now, after you define the object, add a key named `stale` with a value of `true`. Then define another key named `wait` whose value is a function. You'll see that both `stale`, and `wait` get logged.

```js
const boring = {}
boring.stale = true
boring.wait = function () {
    console.log("waiting for the paint to dry ")
}

for (let key in boring) {
    console.log(key)
}
```

What's weird about this is that a standard object inherits from the Big Object in JavaScript. It inherits `toString`, `hasOwnProperty` and several other keys. Why don't those show up in the console?? It's because they are non-enumerable. You can also provide that level of control with `Object.create()`, but can't with standard object creation.

Be aware that the `enumerable` configuration for a property is also `false` by default - just like `writable`, so if you want an enumerable property, you have to specify it.

```js
const exciting = Object.create(null, {
    fun: {
        value: "Wheeee",
        enumerable: true
    },
    joy: {
        value: ["bubbles", "puppies", "pizza"]
    }
})

for (let key in exciting) {
    console.log(key)
}

// Only `fun` gets logged
```

You may be wondering at this point, "So... what's the point? Why do I care if a property is enumerable or not?"

That's a great question. Let's consider an object that has property values that we want to display in the DOM, but it also has method properties.

```js
const JuanRodriguezPatient = {
    firstName: "Juan",
    lastName: "Rodriguez",
    dob: "12/13/1985",
    address: "127.0.0.1",
    gender: "M",
    fullName: function () {
        return `${this.firstName} ${this.lastName}`
    },
    age: function () {
        const dob = new Date(this.dob)
        const yearBirth = dob.getFullYear()
        const now = new Date()
        const yearNow = now.getFullYear()

        return yearNow - yearBirth
    }
}
```

In my application, I want to display all properties and their value into the DOM. Let's image that this is a nurse's report to see a list of all active patients in a doctor's office.

> index.html

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Nashville Software School</title>
  <link rel="stylesheet" href="./styles.css">

</head>

<body>
  <div id="patient-list"></div>

  <script src="juan.js"></script>
  <script src="createElement.js"></script>
</body>
</html>
```

> styles.css

```css
key {
    font-weight: bolder;
    margin: 0 20px 0 0;
    min-width: 100px;
    display: inline-block;
}

key::after {
    content: ":"
}
```

> createElement.js

```js
const patientList = document.querySelector("#patient-list")
const patientElementContainer = document.createDocumentFragment()

// Create an article element to contain all of the properties
const patient = document.createElement("article")

for (let key in JuanRodriguezPatient) { /* eslint no-undef: "off" */

    // The container element for each property
    const property = document.createElement("section")

    // Span element to hold the name of the property
    const keyElement = document.createElement("key")
    keyElement.textContent = `${key.charAt(0).toLocaleUpperCase() + key.slice(1)}`

    // Span element to hold the value of the property
    const valueElement = document.createElement("value")
    valueElement.textContent = `${JuanRodriguezPatient[key]}`

    // Add the two spans to the property <div>
    property.appendChild(keyElement)
    property.appendChild(valueElement)

    // Add the property <div> to the patient <div>
    patient.appendChild(property)
}

patientElementContainer.appendChild(patient)
patientList.appendChild(patientElementContainer)
```

