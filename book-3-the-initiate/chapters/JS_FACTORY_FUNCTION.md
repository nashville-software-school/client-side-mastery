# Factory Functions

Ref: [What Are Factory Functions in JavaScript](https://www.sitepoint.com/factory-functions-javascript/)

First, a factory function is just a regular function. No syntactical difference. We've coined certain functions as factory functions simply because they return new objects.

Yes, this is a factory function.

```js
// This is a factory function. It returns a new object every time.
const createAmplifier = function (volume = 11, color = "Black") {
    return {
        "type": "Guitar Amplifier",
        "maximumVolume": volume,
        "caseColor": color
    }
}

const marshallAmp = createAmplifier(9, "White")
> { "type": "Guitar Amplifier", "maximumVolume": 9, "caseColor": "White" }

const blackstarAmp = createAmplifier(10, "Gold")
> { "type": "Guitar Amplifier", "maximumVolume": 10, "caseColor": "Gold" }
```

No.

```js
// Not a factory function. Primitive type returned.
const add = function (first, second) {
    return first + second
}
```

Yes.

```js
// This is a factory function. It returns a new object every time.
const createLocation = (name, address, type) => ({
    "businessType": type,
    "businessName": name,
    "address": address
})

const kennel = createLocation("Bow Wow Kennels", "100 Infinity Way", "Animal Boarding")
> { "businessType": "Animal Boarding", "businessName": "Bow Wow Kennels", "address": "100 Infinity Way" }
```

No.

```js
// Not a factory function. Primitive type returned.
const isLegal = (activity, age) => age >= activity.minimumAge

const socialActivity = {
    activity: "Buy alcohol",
    minimumAge: 21
}

const april = {
    name: "April Atkinson",
    age: 19
}

const canAprilDrink = isLegal(socialActivity, april.age)
> false
```

> **Lightning Exercise 1:** Write a factory function that creates an object that represents a doctor. The function should accept three arguments.
>
>    1. Doctor's name
>    1. Specialty _(Oncologist, pediatrician, etc...)_
>    1. Address of practice


> **Lightning Exercise 2:** Write a factory function that creates an object that represents a pet. The function should accept two arguments.
>
>    1. Pet name
>    1. Pet breed
>
> Invoke the factory function 3 times and place each animal in an array stored in a variable named `BowWowKennels`

## Practice: Music Row

Your job is to sign each of these promising young music stars to the appropriate label.

* JumpStop Records works with Funk and Rap artists.
* Chatten Records works with Country and Bluegrass artists.
* Polar Records works with Pop artists.

Create an array for each of these record labels.

Create a factory function for each possible genre (_e.g. `createBluegrassArtist()`_). Then invoke the appropriate function for each of the following artists and place the resulting object in the corresponding label array.

* Bruce Atikins is a Country artist and is 23 years old
* Jensen Brown is a Pop artist and is 20 years old
* Dre Funkz is a Funk artist and is 25 years old
* Dusta Grimes is a Rap artist and is 21 years old
* Bartholomew Danielson is a Bluegrass artist and is 23 years old
* Avilee Dallas is a Country artist and is 19 years old
* Austin Kinkaid is a Pop artist and is 22 years old
* Loyoncé Branis is a Rap artist and is 27 years old


