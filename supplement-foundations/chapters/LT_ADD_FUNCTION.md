# Inventory Purchase Function

Time to revisit the unique identifier that you have been adding to every object. It's the `id` property on the object. It was mentioned in a previous chapter that you will eventually learn how to use database systems that will handle adding the `id` property to your data, and automatically increment the value by 1 each time a new resource is created.

In this chapter you are going to write a JavaScript function that will do that task for you for every toy that gets added to Leonid's catalog.

## Phone

You are going to start with writing a function that adds a new phone to your phone store's inventory. In the example code so far, the phone properties include a primary key - which is the `id` property. Time to write a function that will add that property for you when you want to add a new phone to the array.

First, here's an array of phones you can use for reference.

```js
const phones = [
    {
        id: 1,
        name: "iPhone",
        maker: "Apple",
        operatingSystem: "iOS",
        price: 900,
        weight: 1.2
    },
    {
        id: 2,
        name: "Galaxy",
        maker: "Samsung",
        operatingSystem: "Android",
        price: 600,
        weight: 1.4
    }
]
```

Next, you can define an object to represent a new phone for your inventory. This time, don't add an `id` property intially. The function you will write will perform that task.

```js
const pixel = {
    name: "Pixel",
    maker: "Google",
    operatingSystem: "Android",
    price: 399,
    weight: 1.2
}
```

Now write a function to add a phone to the array, with an `id` property added to it. The final code block is at the bottom of the chapter, and includes comments in the code to explain every step.

```js
const addPhoneToInventory = (phoneObject) => {
    const lastIndex = phones.length - 1
    const currentLastPhone = phones[lastIndex]
    const maxId = currentLastPhone.id
    const idForNewPhone = maxId + 1

    phoneObject.id = idForNewPhone
    phones.push(phoneObject)
}

/*
    Now that the function is defined, you can invoke it
    and put a value in the parenthesis (a.k.a. the argument).
    The object will be stored in the `phoneObject`
    parameter for use in the function.
*/
addPhoneToInventory(pixel)

// Display all the phones
for (const phone of phones) {
    console.log(`The ${phone.maker} ${phone.name} costs ${phone.price} dollars. It weighs ${phone.weight} grams.`)
}
```

![](./images/all-phones-with-add-function.gif)

You can even display the raw data just to prove that the `id` property was added to the phone object.

```js
addPhoneToInventory(pixel)

// Display all the phones
for (const phone of phones) {
    console.log(`The ${phone.maker} ${phone.name} costs ${phone.price} dollars. It weighs ${phone.weight} grams.`)
}

// Now show the raw data
console.log(phones)
```

![](./images/all-phones-raw-data.gif)


## Practice: Adding Toys with Functions

Add a similar function to your code for Leonid's application. The code will be _nearly_ identical. You will be using different variable names - because proper variable naming is what professional developers always do - but the logic will be the same.


### Final Example Code

```js
const phones = [
    {
        id: 1,
        name: "iPhone",
        maker: "Apple, Inc.",
        operatingSystem: "iOS",
        price: 900,
        weight: 1.2
    },
    {
        id: 2,
        name: "Galaxy",
        maker: "Samsung",
        operatingSystem: "Android",
        price: 600,
        weight: 1.4
    }
]

const addPhoneToInventory = (phoneObject) => {
    /*
        Step 1: Get maximum id current in array
    */
    // Get index of last item in array
    const lastIndex = phones.length - 1

    // Get the last object in the array
    const currentLastPhone = phones[lastIndex]

    // Get id property value of last phone
    const maxId = currentLastPhone.id


    /*
        Step 2: Increase the current max id by 1
    */
    const idForNewPhone = maxId + 1


    /*
        Step 3: Add the id property to the phone object
    */
    phoneObject.id = idForNewPhone


    /*
        Step 4: Add the phone object to the array
    */
    phones.push(phoneObject)
}

const pixel = {
    name: "Pixel",
    maker: "Google",
    operatingSystem: "Android",
    price: 399,
    weight: 1.2
}

addPhoneToInventory(pixel)

for (const phone of phones) {
    console.log(`The ${phone.maker} ${phone.name} costs ${phone.price} dollars. It weighs ${phone.weight} grams.`)
}

console.log(phones)


/*
    Commented out the "find" code
 */

// const phoneToFind = 2
//
// for (const phone of phones) {
//     if (phone.id === phoneToFind) {
//         phone.weight = phone.weight + 0.4
//         console.log(`The ${phone.maker} ${phone.name} costs ${phone.price} dollars. It weighs ${phone.weight} grams.`)
//     }
// }

```