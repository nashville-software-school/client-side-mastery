# Click Events

All interactions and functionality should be written in the javascript files. This adheres to the `separation of concerns` principle. 

* HTML - display
* CSS - style
* Javascript - functionality/interaction

Within the javascript we will target the DOM and add an event listener that will listen for `clicks`. When a click happens, execute a function.


```html
	<button id="greeting">Hello</button>
```

```js
	const handleGreetingClicked = () => {
		console.log("You are amazing!");
	}

	document.querySelector("#greeting").addEventListener("click", handleGreetingClicked);

```
Depending on the situation, we can also handle the click within the `addEventListener` with an `anonymous  function`.

```html
	<button id="goodbye">See Ya Later</button>
```
```js
	document.querySelector("#goodbye").addEventListener("click", event => {
		console.log("Wait, what is event?", event)
	});
	//version 2 for the greeting and anonymous function
	document.querySelector("#greeting").addEventListener("click", (event) => handleGreetingClicked(event));
```

For every event, an object is automatically created and is passed as an argument to the function. Check out the dev tools to see the properties on the event object.



### What if I have a bunch of journal entries or fish components and they all need a button? Do I create button code for each one?

The `event` object has two properties we can reference: `target` and `currentTarget`. There is also native functionality called 'bubbling'.

We can put all of our "html cards" (elements) into a parent container. The parene will receive the eventListener. The parent will do all the listening. Clicking on items in the parent container will `bubble` the event up to the top - the parent.

[Bubbling Slide Show](https://jamboard.google.com/d/1ACcVZd3--oIUwzzqHoKGWLeU4jAA2EDKh_RuyaRMc6Q/edit?usp=sharing)

1. Target a parent container on the DOM and `addEventListener` for click
1. Generate your list of items, each with a unique id. Add the id to any element you want to target.
```jsx
	`<p id="showmore--${obj.id}">Show More</p>`	
```
3. Use conditional/switch statement to determine which item was selected.
```js
	if (event.target.id.startsWith("showmore")){
```
4. Use `string` and `array` methods to identify the unique id.
```js
	const splitId = event.target.id.split("--");
	console.log("what is splitId", splitId);
	console.log("I want to learn more about id:", splitId[1])
```

5. Use the unique `id` to target the initial state and thus reference or change only that item.