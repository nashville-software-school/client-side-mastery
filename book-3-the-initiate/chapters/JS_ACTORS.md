# Powerful Object Creation in JavaScript

## Key Concept

* Objects represent things, or actors, in our application
* Properties describe the objects
* Methods define their behavior
* Applications are composed of actors

## Actor

What do I mean by actor? To understand that, let's look at the definition of one of the core principles that professional software developers use to build flexible, scalable, maintainable systems - the Single Responsiblity Principle [SRP]. It's part of the collection of  SOLID principles.

You need to read the [SOLID: Part 1](https://code.tutsplus.com/tutorials/solid-part-1-the-single-responsibility-principle--net-36074) article which covers the SRP and the term *Actor*.


### Defining Behavior

Using `Object.create` strengthens the idea that the object you are creating is an actor in your application. An actor can exhibit behaviors, and can expose interfaces for other code to interact with it. Up to this point in the course, you have been defining your databases with standard object creation. Start thinking of your database as an actor in the system. I'll use the home inventory database as an example.

```js
const HomeInventoryDatabase = Object.create(null, {
    furniture: {
        value: []
    },
    crafts: {
        value: []
    },
    electronics: {
        value: []
    }
})
```

Now that the database is rewritten with `Object.create`, consider the actions we want to perform on the database. In the exercises, there were two actions:

1. Saving it to local storage as a string
1. Loading the local storage string and turning it back into an object

Let's define those actions on the object itself.

```js
const HomeInventoryDatabase = Object.create(null, {
    furniture: {
        value: []
    },
    crafts: {
        value: []
    },
    electronics: {
        value: []
    },
    save: {
        value: function () {

        }
    },
    load: {
        value: function () {

        }
    }
})
```

Notice that the `value` of the two new properties are functions. Functions define behavior on objects. When professional developers talk about functions on objects, they use the word "method". In this case, our database has a save method, and a load method. Time to put the logic in them that define the behavior.

```js
const HomeInventoryDatabase = Object.create(null, {
    furniture: {
        value: [],
        enumerable: true
    },
    crafts: {
        value: [],
        enumerable: true
    },
    electronics: {
        value: [],
        enumerable: true
    },
    save: {
        value: function () {
            localStorage.setItem("HomeInventory", JSON.stringify(this))
        }
    },
    load: {
        value: function () {
            const storageObject = localStorage.getItem("HomeInventory")
            this.furniture = storageObject.furniture
            this.crafts = storageObject.crafts
            this.electronics = storageObject.electronics
        }
    }
})
```

### Custom get/set Logic

### Inheritance

## With Great Power Comes Great Responsibility

Now that we've covered the power, flexibility, and control that `Object.create()` gives you, you must remember to use your new power responsibly.

Just because you can wield the Force, doesn't mean you should use it for everything.

![with power comes responsibility](./images/object-create-responsibility.gif)

> *A new JavaScript developer using `Object.create()` when it's not needed, and a simpler implementation is more appropriate.*

Only use `Object.create()` when you are creating an actor that is needed for your application. Something that requires descriptive properties, controlled access to those properties, has state that needs to be maintained, and/or complex behaviors. If all you need to do is store key/value pairs of data, then a simple object is perfectly fine.

#### This is Overkill

No reason to use `Object.create()` in this case. It's just a simple key/value store.

```js
const pen = Object.create(null, {
    nibType: {
        value: "Medium"
    },
    cartridgeSize: {
        value: "European"
    },
    material: {
        value: "Resin"
    },
    length: {
        value: 4.50
    }
})
```

It would more appropriate to use the simplistic object creation syntax.

```js
const pen = {
    nibType: "Medium",
    cartridgeSize: "European",
    material: "Resin",
    length: 4.5
}
```

You would be even better served by using a [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) since all that you need is to store keys and values. Using `Map` leaves all the baggage of a standard object behind. Remember, with a standard object, you immediately inherit `hasOwnProperty()`, `toString()`, `valueOf()`, and several other methods that simply aren't needed when you're just storing keys and values.

```js
const pen = new Map()
pen.set("nibType", "Medium")
pen.set("cartridgeSize", "European")
pen.set("material", "Resin")
pen.set("length", 4.5)
```

#### Not Enough Control

Conversely, this is not a good example of using a standard object.

```js
const Article = {
    id: "5a347edb-0691-4471-8049-c4b619e6dba7",
    title: "Object in JavaScript are cool!",
    date: 1512877301083,
    author: "Steve Brownlee",
    content: "Using Object.create() gives you such incredible control when creating objects in your system that are actors with properties and behaviors",
    tags: ["nss", "objects", "javascript"]
}
```

When you pass the reference to this object around to other functions, or modules later in the course, it is far too easy for that other code to inadvertantly modify the property values. Imagine if another developer on your team wrote a function whose job was to display the HTML representation of this object, but they introduced an error where they stripped off the `id` property, or change the `date` property.

That would lead to serious bugs in the application that would need to be fixed later, after the code is in production being used by your customers.

That's bad.

Let's exert some control.

```js
const Article = Object.create(null, {
    id: {
        value: "5a347edb-0691-4471-8049-c4b619e6dba7",
        enumerable: true
    },
    title: {
        value: "Object in JavaScript are cool!",
        enumerable: true
    },
    author: {
        value: "Steve Brownlee",
        enumerable: true
    },
    content: {
        value: "Using Object.create() gives you such incredible control when creating objects in your system that are actors with properties and behaviors",
        enumerable: true
    },
    date: {
        value: 1512877301083,
        enumerable: true
    },
    _tags: {
        value: ["nss", "objects", "javascript"],
        enumerable: true
    },
    tags {
        get: function () {
            return this._tags.join(",")
        },
        set: function (tags) {
            this._tags = tags.split(",")
        }
    },
    publish: {
        value: function () {
            this.date = Date.now()
        }
    },
    htmlRepresentation: {
        value: function () {
            return `
                <article id="${this.id}">
                    <h2>${this.title}</h2>
                    <div>
                        ${this.content}
                    </div>
                    <footer>
                        Published on <date>${this.date}</date>
                    </footer>
                </article>
            `
        }
    }
}
```

Now the article is an actor in the system. It has not-writable properties, a custom get/set for the `tags` property, a publish behavior, and provides a HTML representation method to ensure that it is rendered the same way by any external code.

