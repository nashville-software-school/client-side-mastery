# Factory Functions

## Definitions

First, a factory function is just a regular function. No syntactical difference. We've coined certain functions as factory functions simply because they return new objects.

Read more with the article "[What Are Factory Functions in JavaScript?](https://www.sitepoint.com/factory-functions-javascript/)"

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
