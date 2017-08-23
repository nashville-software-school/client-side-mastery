# :pushpin: Exercises

1. [Testing Math](../exercises/MJ_TESTING_MATH.md)
1. [Word Checker](../exercises/MJ_TESTING_WORD_CHECKER.md)

# Unit testing your code

We're going to be using the [Jasmine](https://jasmine.github.io/2.4/introduction.html).

## Setup

```bash
# Instructions to install `wget` and `unzip`
mkdir ~/workspace/unit-testing && cd $_
wget https://github.com/jasmine/jasmine/releases/download/v2.4.1/jasmine-standalone-2.4.1.zip
unzip jasmine-standalone-2.4.1.zip
touch src/math.js
touch spec/MathSpec.js
echo "Done"
```

## Write the test before the solution

One of the core ideas behind writing testable code is to plan the code you want to write, and then write a test that defines what the behavior of the code should be, and **then** write the code that passes the test.

1. Find out what you have to do.
1. Write a UnitTest for the desired new capability. Pick the smallest increment of new capability you can think of.
1. Run the UnitTest. If it succeeds, you're done; go to step 1, or if you are completely finished, go home. If it doesn't work...
1. Fix the immediate problem: maybe it's the fact that you didn't write the new method yet. Maybe the method doesn't quite work. Fix whatever it is. Go to step 3.

A key aspect of this process: don't try to implement two things at a time, don't try to fix two things at a time. Just do one.

## Basic example

Let's think about a very basic math application you want to write with JavaScript. It will have the ability to add, and subtract two numbers.

Using the Jasmine syntax, let's write the tests first in the `spec/MathSpec.js` file.

```js
describe("The specification for basic math", function() {

  it("should have an add function", function() {
    expect(add).toBeDefined();
  });

  it("should add two integers", function() {
    expect(add(2, 5)).toBe(7);
  });

  it("should have a subtract function", function() {
    expect(subtract).toBeDefined();
  });

  it("should subtract two integers", function() {
    expect(subtract(7, 5)).toBe(2);
  });

});
```

### Adding assets

Now open your `SpecRunner.html` file and include the `src/math.js` file and the `spec/MathSpec.js` file.

```html
  <!-- include source files here... -->
  <script src="src/math.js"></script>

  <!-- include spec files here... -->
  <script src="spec/MathSpec.js"></script>
```

### Running failed tests

Open up the `SpecRunner.html` file in your browser and see your tests fail. This is the first step in test driven development.

### Making tests pass

Open the `src/math.js` file and paste the following code into it.

```js
function add (one, two) {
  return one + two;
}
```

Reload your browser and you'll see that 1 less test failed. Now, implement code to make all the tests pass.

# Resources

* A basic [Jasmine tutorial](http://evanhahn.com/how-do-i-jasmine/)
* [Jasmine install docs](https://github.com/jasmine/jasmine#installation)
