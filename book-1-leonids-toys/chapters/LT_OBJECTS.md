# Toy Objects

In this chapter, you will be using the object data structure that you learned about in Chapter 2 to represent some toys in code.

## Learning Objectives

* You should be able to demonstrate that you can create objects with the correct syntax.
* You should be able to explain that variables are labels that refer to values, not the value itself.

## Setup

Run these commands to have a file in which you can write your code.

```sh
mkdir ~/workspace/toy-objects
cd ~/workspace/toy-objects
touch leonids-toys.js
```

Then open that directory in Visual Studio Code with the following command.

```sh
code .
```

And open the `leonids-toys.js` file and follow the directions.

## Directions

In the last chapter, you wrote down all of the properties of a toy that Leonid would need to track for his shoppe. Now you need to create some JavaScript objects to represent a couple of toys.

Define three toys of your choosing. Assign each one to a different variable name. Make your key names as descriptive as possible. Do not abbreviate or use shortcuts. For example, if you chose `manufacturer` as a property of a toy, do not shorten it to `mfr`.

For reference, here's the phone objects that were examples in the last chapter.

```js
const iPhone = {
    id: 1,
    name: "iPhone",
    maker: "Apple",
    operatingSystem: "iOS",
    price: 900,
    weight: 1.2
}

const galaxy = {
    id: 2,
    name: "Galaxy",
    maker: "Samsung",
    operatingSystem: "Android",
    price: 600,
    weight: 1.4
}
```


When you have defined three toy objects, review with a teammate or a member of your instructional team. When describing your object, also be as descriptive as possible and mention the data types.

> "The iPhone object has a string maker property, a string operating system property, an integer price property, and a float weight property."
