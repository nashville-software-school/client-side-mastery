# Objects with Object.create()

You can also use `Object.create()` to initialize an object. Let's rewrite the `expense` object with this method.

```js
const expense = Object.create({}, {
    dateCreated: {
        enumerable: true,
        writable: false,
        value: "01/01/2017"
    },
    location: {
        enumerable: true,
        writable: false,
        value: "Bob's Burgers"
    },
    dollarAmount: {
        enumerable: true,
        writable: false,
        value: 14.34
    },
    purpose: {
        enumerable: true,
        writable: false,
        value: "Lunch with very important client"
    },
    code: {
        enumerable: false,
        writable: true,
        value: "1001A"
    }
})
```

You might be thinking this right now.

> "Um, this seems like way too much code to write when I can just do it the other way. Why would I ever do this?"

You use `Object.create()` when you want to have fine-grained control over the state and behavior of an object. Using simple object create with `{}`, you don't have much control. You'll learn more about this as your continue through the course.

For now, using simple object creation is fine.

> **Googling Tip**:
>
> [Writable and enumerable properties](http://bfy.tw/Gu9L)
>

## Object State

Ok, I mentioned "object state" above, and you might not understand what I mean by that. Stated as simply as possible, when you hear the words _object state_, it means that you want to know what the values of an object's properties are _**at this moment in time**_. That means an object's state can change, i.e. a property's value can be reassigned.

```js
const employee = {
    firstName: "Michael",
    lastName: "Tambornino",
    role: "Sales Rep",
    accountNumber: "1-8349058340"
}
```

Those property values define the __*initial state*__ of this employee that we're representing in code.

```js
employee.role = "Sales Manager"
```

I just changed the state of the JavaScript object that is representing Michael Tambornino.

## Videos to Watch

1. [What's an Object in JavaScript?](https://www.youtube.com/watch?v=8iXoWC9XcU8)
1. [Objects and Prototypes In-depth 02 - Objects Basics](https://www.youtube.com/watch?v=yHkPHteghSc&index=2&list=PLqq-6Pq4lTTaflXUL0v3TSm86nodn0c_u)
1. [Objects and Prototypes In-depth 03 - Creating Objects](https://www.youtube.com/watch?v=25wlojU2mHg&index=3&list=PLqq-6Pq4lTTaflXUL0v3TSm86nodn0c_u)
1. [Object Keys](https://www.youtube.com/watch?v=cEVnlKgySsg)
1. [Javascript - How to Access Javascript Object Property Names Using A `for in` LOOP](https://www.youtube.com/watch?v=fDBuAnu0fvo)
1. [Modular Javascript - Prototypal Pattern vs Classical OOP in JS](https://www.youtube.com/watch?v=doXpW5AD60Q)
1. [Object.create - Object Creation in JavaScript P6 - FunFunFunction #57](https://www.youtube.com/watch?v=CDFN1VatiJA)

## Practice

Use `Object.create()` to define objects for every place that you've worked before NSS.

For example:

```js
const ChickFilA = Object.create({}, {
    business: {
        value: "Chick-Fil-A"
    },
    employmentStart: {
        value: "01-01-2009"
    },
    employmentEnd: {
        value: "01-01-2010"
    }
})
```

You add as many properties as you want for each job.

1. Things you liked about the job
1. Things you hated about the job

etc...

## Challenge

Write a function that will build, and return, a job object. Make sure you define an argument for each one of the properties you want to be in the object.

```js
const JobMaker = (a,r,g,u,m,e,n,t,s) {
    return theObjectYouBuilt
}
```

## Advanced Challenge

1. Put each of your jobs into an array.
1. Iterate over the array, and use `document.createElement()` to build an `<article>` element representing each job. The `id` property of the element should be the name of the business.
