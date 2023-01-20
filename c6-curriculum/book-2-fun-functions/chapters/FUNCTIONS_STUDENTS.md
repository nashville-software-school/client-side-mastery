## Student Grades

Remember that to add a new property to an object, you use dot notation and an equals sign after the object is created.

```js
// Object creation
const dog = {
	breed: "Shihtzu",
	age: 1,
	name: "Murph"
}

// Adding a property after creation
dog.neutered = true

console.log(dog)

> {
	breed: "Shihtzu",
	age: 1,
	name: "Murph",
	neutered: true
}
```

### Setup

```sh
cd
cd workspace
mkdir functions-students
cd functions-students
touch main.js
code .
```

Once VS Code starts, open the `main.js` file and follow the instructions below.

### Instructions

In this exercise, you will define four functions. One will create a student object, and the other three will add a grade for a subject to the student object.

1. `createStudent()` should return a new student object. The name of the student, and which grade the student is in, must be passed to the function as arguments. The returned object should have a `name` property and a `grade` property.
1. `addMathGrade()` should add a new "math" property to the student with a value of "B".
2. `addHistoryGrade()` should add a new "history" property to the student with a value of "C".
3. `addScienceGrade()` should add a new "science" property to the student with a value of "A".

Remember to follow the flow that you learned about in the last chapter.

1. Each function should define a parameter to hold the object.
2. Each function should be invoked with an object provided as an argument.
3. Each function should return the object after the property is added.
4. The return value of the function should be stored in a variable.

#### Helpful hints

You can expand the hints below if you are stuck and don't know what to do. Make sure you try a few times and fail, and then talk with your teammates before looking at the hints.

<details>
    <summary>Hint: Final object state</summary>

```js
// Example. The order of the properties are irrelevent.
{
	student: "Andri Alexeandrou",
    grade: 6,
	math: "B",
	history: "C",
	science: "A",
}
```

</details>
