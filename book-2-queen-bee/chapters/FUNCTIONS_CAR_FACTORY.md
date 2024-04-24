## Deconstruction: Car Factory

Write software that builds a Ford Fever (_Not a real car. Don't tell Ford._). This software is a simulation of a car factory, and it need to make a chassis and then add wheels, an engine, a steering wheel, a body, and a drive train.

Aaaahhh, that's too hard!

It does seems that way until you deconstruct that task into smaller, individual ones. Each part of creation would be performed by a minion - a function - that does a very specific thing.

1. Produce a car chassis (_no input, outputs new chassis object_)
2. Add 4 wheels to chassis (_input is a chassis, output is chassis with wheels_)
3. Add an engine to chassis (_input is a chassis, output is chassis with an engine_)
4. Add a steering wheel to chassis (_input is a chassis, output is chassis with a steering wheel_)
5. Add a body to chassis (_input is a chassis, output is chassis with a body_)
6. Add a drive train to chassis (_input is a chassis, output is chassis with a drive train_)

Looks like all but the first one of those functions needs something given to it in order to do its job - a chassis. Therefore, each function needs a single parameter. That parameter will store an object that represents a chassis.

```js
const addBody = (chassisObject) => {
	// Use dot notation to add a new property
	chassisObject.body = "Fever"

	// Return the chassis that now has a body property on it
	return chassisObject
}
```

The first function takes no input. It simply creates and returns a brand, new object that represents a chassis.

```js
// No parameters defined because function needs nothing to do its job
const createChassis = () => {
	// Create a new object. No properties yet.
	const newChassisObject = {	}

	return newChassisObject
}
```

## Practice: Completing the Ford Fever

Your job is to create the following functions. Each function should add a property to the chassis. Please use the function names and property names listed.

1. The `addWheels()` function should have a parameter for the incoming chassis object. It should add a new property to that object named `wheels` with a value of 4. The function should return the chassis object.
2. The `addEngine()` function should have a parameter for the incoming chassis object. It should add a new property to that object named `engine` with a value of "4.8L". The function should return the chassis object.
3. The `addSteeringWheel()` function should have a parameter for the incoming chassis object. It should add a new property to that object named `steeringWheel` with a value of "Tilting". The function should return the chassis object.
4. The `addDriveTrain()` function should have a parameter for the incoming chassis object. It should add a new property to that object named `driveTrain` with a value of "Two wheel drive". The function should return the chassis object.

Make sure you invoke each function, store the returned object in a variable, and then use `console.log()` to ensure that each of your little minions is doing its job correctly.

## Example Code

Note in the code below that the object that gets returned from the `makeChassis()` function above is stored in the chassis variable. That value is then sent to the `addBody()` function as that function's input.

You can pass values from function to function! Like a chassis moving down the assembly line at an actual car factory.

![assembly line animation](https://storage.googleapis.com/replit/images/1590241812145_5f6f7764dbb69a6f63230c9f48d58b7d.gif)

```js
let chassis = createChassis()
console.log(chassis)
> {}

/*
	Note in the code below that the object that gets returned from the
	makeChassis() function above is stored in the chassis variable. That
	value is then sent to the addBody() function as that function's input.
*/
let chassisWithBody = addBody(chassis)
console.log(chassisWithBody)
> { body: "Fever" }
```
