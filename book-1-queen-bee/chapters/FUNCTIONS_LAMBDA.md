# Function With No Name

If you're familiar with the America hit titled "A Horse With No Name", then you know these lyrics.

> I've been through the desert on a horse with no name
>
> It felt good to be out of the rain
>
> In the desert you can remember your name
>
> 'Cause there ain't no one for to give you no pain

Unfortunately, dealing with functions in software as a beginner does involve quite a bit of cognitive pain.

## The Basics

Variable hold values. Whether it is a number...

```js
const bumblebees = 55
```

or a boolean...

```js
const stung = false
```

or a function...

```js
const collectHoney = (hive) => {
	return hive.honeyAmount
}
```

## Arguments and Parameters

You can pass any value to a function. Whether it is a number...

```js
storeHoney(55)
```

or a boolean...

```js
setHiveActive(true)
```

or a function...

```js
capture( () => { console.log("Bumblebee captured with vacuum" ) } )
```

That's right. Time for the pain.  I just passed a function to another function as an argument. The function itself was not stored in a variable. It was defined on-the-fly and can be referenced by the `capture()` function like so.

```js
const capture = (whatShouldISay) => {
	whatShouldISay()  // Here is where the function is invoked
}
```

This level of power allows you to make functions do things that aren't defined directly in the function. In this case, the `capture()` function doesn't really do anything itself. It simply invokes whatever function is passed as an argument, and those instructions run.

## Why Are We Showing This To You?

In future chapters, you are going to be writing these unnamed, or anonymous, functions. The super fancy developer word for these kind of functions is "lambda expression".

Here's an example of what's coming up.

You are going to be writing JavaScript code that runs in the web browser, not just in the terminal. The web browser is an event-rich environment.

People can click on things, type things in, scroll the window, click and drag things, start audio clips, start video clips, move their mouse around, choose options, and many more things. When a person performs any one of these actions, the web browser emits a very specific event.

You will be writing code that listens for those events. You do it by invoking the `addEventListener()` function that is built into the JavaScript language. Here's a sample of code that would let you define what should happen when a user clicks on a button.

```js
button.addEventListener(
	"click",
	(clickEvent) => {
		addEggToBasket()
	}
)
```

As you can see, the `addEventListener` function got passed two arguments.

1. First argument is a string specifying what event to listen for.
2. Second argument is a function that will run in the future when the user actually clicks on the button. This function is not stored in a variable. It is anonymous.

## For The Brave Of Heart

If you'd like to practice passing anonymous functions around and using lambda expressions, see if you can tackle this challenge.

1. Define a function named `broadCast`. It should define a single parameter, whose value will be a function.
1. Define a function named `announceRain` that should log this message to the console: "Grab an umbrella. It's going to rain today."
1. Define a function named `announceClear` that should log this message to the console: "Grab your shades and sunscreen. It's going to be sunny and hot today."
1. Define a function named `weatherStation`. It should define a single parameter, whose value will be the day's humidity reading. If the humidity is over 95, then the console should display the rainy weather message. If it is below 95, then the sunny weather message should appear.

### Helpful hints

You can expand the hints below if you are stuck and don't know what to do.

<details>
    <summary>Hint: Broadcasting</summary>

```js
const broadCast = (messageInstructions) => {
	messageInstructions()
}
```
</details>

<details>
    <summary>Hint: Weather station</summary>

```js
const weatherStation = (humidity) => {
    if (humidity > 95) {

    }
    else {

    }
}

weatherStation(99)
weatherStation(13)
```
</details>
