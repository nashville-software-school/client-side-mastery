# ES6 Modules

We are going to start writing modular code using ES6 Modules. This means that just like we have been doing so far, we are going to have multiple Javascript files. But instead of using multiple `script` tags to link each of them to our `index.html`, we are only going to link a single JS file. This JS file is where our main logic will be.

Let's look at an example:

> index.html

```html
<body>
  <article id="container"></article>

  <script type="module" src="./src/scripts/main.js"></script>
</body>
```

As you can see, the HTML file only contains a single `script` tag. This script tag has an additional attribute called `type` and it's value is `module`. This will let the browser know that we will be using ES6 modules and to make sure to take into account our import and export statements which we will look at below.

> main.js

```js
/*
    Purpose:
    Get a random number fact and append it to the DOM.
*/

import data from "./data.js"
import dom from "./dom.js"

data.getNumberTrivia()
.then(triviaResponse => dom.printToDom(triviaResponse));

```

`main.js` is the module that your HTML file references. Notice the import statements at the top. This is how other JS modules are pulled in by your application. So even though your `index.html` only specifies one Javascript file, your application will now look at import statements and pull in those Javascript modules for you.

> data.js

```js
/*
    Purpose:
    This module contains a method to make a fetch call to the Numbers API to get a random fact about a number.
*/

const data = {
  getNumberTrivia () {
      return fetch("http://numbersapi.com/random/trivia")
          .then(response => response.text())
  }
}

export default data
```

Keeping in mind the Single Responsibility Principle, we have one module responsible for fetching the data: `data.js`. The module `dom.js` is responsible for putting the data on the DOM.

> dom.js

```js
/*
    Purpose:
    This module contains a method that takes number trivia as a string and puts it on the DOM.
*/

const dom = {
  printToDom (trivia) {
    const containerRef = document.querySelector("#container");
    let triviaHtml = `<p>Number Trivia: ${trivia}</p>`;
    containerRef.innerHTML = triviaHtml;
  }
}

export default dom
```

Both of the modules have export statements at the bottom. This specifies what is available outside the scope of the module. The export statements make sure that these modules can be imported in other modules, like `main.js`.


Let's look at an another example:

> library.js

```js
/*
    Purpose:
    This file contains all code related to manipulating,
    or accessing all library books.
*/

const BooksDatabase = [
    {
        "id": 1,
        "title": "To Kill a Mockingbird",
        "author": "Nelle Harper Lee",
        "available": false
    },
    {
        "id": 2,
        "title": "Pride and Prejudice",
        "author": "Jane Austen",
        "available": false
    },
    {
        "id": 3,
        "title": "The Little Prince",
        "author": "Antoine de Saint-Exupéry",
        "available": true
    },
    {
        "id": 4,
        "title": "Harry Potter and the Sorcerer's Stone",
        "author": "J.K. Rowling",
        "available": false
    },
    {
        "id": 5,
        "title": "The Hunger Games",
        "author": "Suzanne Collins",
        "available": false
    },
    {
        "id": 6,
        "title": "The Book Thief",
        "author": "Markus Zusak",
        "available": false
    },
    {
        "id": 7,
        "title": "Harry Potter and the Chamber of Secrets",
        "author": "J.K. Rowling",
        "available": true
    },
    {
        "id": 8,
        "title": "Catching Fire",
        "author": "Suzanne Collins",
        "available": true
    }
];

const BooksMethods = {
    getBook: function (bookTitle) {
        return BooksDatabase.find(book => book.title === bookTitle);
    },
    checkOutBook: function (bookTitle) {
        if (this.getBook(bookTitle).available) {
            this.getBook(bookTitle).available = false
        } else {
            throw "Book is currently unavailable";
        }
    },
    returnBook: function (bookTitle) {
        this.getBook(bookTitle).available = true;
    },
    availableBooks: function (bookTitle) {
        return BooksDatabase.filter(book => book.available === true);
    }
}

export default BooksMethods;
```

Here we have a module that contains an array of all books in the library and the actions that can be taken on this data as methods. The file `library.js` is a Javascript module. This means that it has its own block scope. Nothing outside this module can access anything defined in the module. So how do you use any of the methods we have in this module from another module?

Anything that you want access to outside of the scope of the module, you will have to export. In this module, because I want to export more than one thing, I put everything I want to export into an object and export that object. In other words, I want code outside this module to be able to execute the four functions: `getBook`, `checkOutBook`, `returnBook`, `availableBooks`. I define an object called `BooksMethods` that now has those functions as methods. Finally, notice the export statement at bottom of my module.

> libraryMembers.js

```js
import library from "./library.js"

/*
    Purpose:
    This file contains all code related to manipulating,
    or accessing the list of library member's books.
*/

const MembersBooksDatabase = [
  {
    "id": 1,
    "firstName": "Rose",
    "lastName": "Thorne",
    "books": ["To Kill a Mockingbird", "Pride and Prejudice"]
  },
  {
    "id": 1,
    "firstName": "Daisy",
    "lastName": "Stemm",
    "books": ["Harry Potter and the Sorcerer's Stone", "The Hunger Games", "The Book Thief"]
  }
];

const MembersBooksMethods = {

  getMember: function (memberFirstName, memberLastName) {
    return MembersBooksDatabase.find(member => member.firstName === memberFirstName && member.lastName === memberLastName);
  },
  getCheckedOutBooks: function (memberFirstName, memberLastName) {
    return this.getMember(memberFirstName, memberLastName).books;
  },
  memberCheckOutBook: function (memberFirstName, memberLastName, book) {
    // console.log(library.availableBooks());
    library.checkOutBook(book);
    // console.log(library.availableBooks());
    this.getMember(memberFirstName, memberLastName).books.push(book);
  }
}

export default MembersBooksMethods;
```

If you want to use what's being exported from another module in your current module, you must import it. The import statement at the top of this module imports whatever is being exported from `library.js` and puts it in the variable `library` which you can then use throughout this module. If you remember, an object with four methods was exported from `library.js`. This means that `library` should contain an object with four methods. Try console logging to see the value. Essentially, the import statement is saying give me what was exported from a certain file(`library.js`) and put in this variable(`library`) so I can use it in the scope of this module(`libraryMembers.js`).

> main.js

```js
/*
    Purpose:
    This code is where a member, Rose, checks out a book.
*/

import libraryMembers from "./libraryMembers.js"

let booksRose = libraryMembers.getCheckedOutBooks("Rose","Thorne");
console.log("Rose's Books: ", booksRose);

libraryMembers.memberCheckOutBook("Rose","Thorne", "The Little Prince");
console.log("Rose's Books: ", booksRose);
```

Finally, we have our `main.js`, which is the only JS file that is linked to our `index.html`. As we saw earlier, we are importing what has been exported from `./libraryMembers.js` to this module because we need to call the `memberCheckOutBook` method. Notice we do not import the `library.js` module here.

Because this is the module that is linked to our html, this is the starting point. Our application starts with this JS file. It sees the import for `libraryMembers.js` in this module and pulls in the libraryMembers module. It sees the import for `library.js` in the libraryMembers module and pulls in the library module. This means that not every module you want to use needs to be imported to the JS file you are linking to your `index.html`. But, every module needs to trace it's way back to the linked JS file, even if it's not directly.
