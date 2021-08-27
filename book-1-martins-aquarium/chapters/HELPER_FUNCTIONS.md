# Helper Functions

Helper functions make repetitive or complicated tasks easier and keep your code DRY (Don’t Repeat Yourself). 

Here are a few examples:

1. Take an array of string values and convert into a string with commas and the word `and` before the last one.

>helpers.js
```js
const colors = ["vanilla", "chocolate", "lemon", "berry"];

export const arrayToStringFormatter = (arr) => {
	const last = arr.pop();
	return `${arr.join(', ')} and ${last}`;
}
```

2. Capitalize the first letter of a string

>helpers.js
```js
export function firstLetterCase(str) {
   return (str.charAt(0).toUpperCase() + str.slice(1));
}

```

3. For each entry in a list, change the background color on the DOM.

>helpers.js
```js
const colorClassArray = ['Dark', 'Medium', 'Lite'];
let colorCount = 0;
export const cycleBackgroundColor = () => {
	const variant = colorClassArray[colorCount];
	//ternary statement
	//this could also be written as a conditional with if else
	colorCount < colorClassArray.length - 1 ? colorCount++ : colorCount = 0;
	return variant.toLowerCase();
}
```

```css
.fishName {
  color: rgb(82, 82, 73);
}
.dark {
	background-color: #fd676e;
}
.medium {
	background-color: #878bc5;	
}
.lite {
	background-color: #6cc3d5;
}
```
From other js files, we can invoke `cycleBackgroundColor` to get the various colors and apply them to the element class list.

```js
import { cycleBackgroundColor } from './helpers.js';

const contentElement = document.querySelector('main');

const arrayOfFish = ["gold Fish", "tang", "shark", "whale", "trout", "Minnow"];

let htmlString = "";
arrayOfFish.forEach(item => {
  htmlString += `<h2 class="fishName ${cycleBackgroundColor()}">${item}</h2>`
})

contentElement.innerHTML = htmlString;
```
### Other Opportunities
What are some other situations where you might want to use a helper function?

* Add/remove the dashes in a phone number
* Convert dates into specific format
* Count words of a paragraph
* Convert fahrenheit to celsius
* Remove characters from text
* Etc. 