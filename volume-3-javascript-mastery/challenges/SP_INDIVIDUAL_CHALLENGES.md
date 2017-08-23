<a id="challenge-1"></a>
## Challenge \#1 - Flexbox Warmup Challenge
Complete all 24 levels of Flexbox Froggy 
http://flexboxfroggy.com/

<a id="challenge-1"></a>
## Challenge \#2 - Flexbox Part 2
Grow your carrot garden
http://cssgridgarden.com/

<a id="challenge-2"></a>
## Challenge \#3 - Music History with Flexbox

### Flexbox branch

In your Music History repository folder, create a new branch for this challenge.

`git checkout -b mh-flexbox`

### Requirements

Using your new CSS skills, you'll build even better looking music history pages.

1. Use the Flexible Layout Box model to ensure that both the form section and the content section are the same height.
1. The entire container for the even songs (plus its details) should have a background color of Sea Shell (SeaShell or \#FFF5EE)
1. The entire container for the odd songs (plus its details) should have a background color of Mint Cream (MintCream or \#F5FFFA)
1. The first song container should have bold text.
1. Set the navigation bar's position so that it's always on the top of the page, even if you scroll down. To ensure this works, you can just add some div tags at the bottom of the page that add enough text that would force you to scroll the browser.

### Resources

* [Flexbox in GIFs](https://medium.freecodecamp.com/an-animated-guide-to-flexbox-d280cf6afc35#.8ekxunyxu)
* [A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

<a id="challenge-3"></a>
## Challenge \#4
### Whither the Weather? 
#### Use the OpenWeather API to build a weather forecast search tool

* Pick three types of forecasts to choose from
* User inputs zipcode and selects forecast type from a dropdown
* Use an xhr to fetch the api data. The syntax will be just like the calls you have written to fetch a local JSON file, only you'll be pulling in remote data. It will return the data in JSON by default
* Present the returned data in a nicely styled display. Use a image to accompany the forecast/conditions, such as a cloud with raindrops when the chance for precip is above a certain percentage.
* The UI should use Bootstrap

OpenWeatherMap API (scroll to bottom to see documentation)
> http://openweathermap.org/api 

You must sign up to receive an API key
> http://home.openweathermap.org/users/sign_up

Example of an API call to get a 5-day forecast for 37201
> api.openweathermap.org/data/2.5/weather?zip=37201&APPID=1111111111

<a id="challenge-4"></a>
## Challenge \#5 - Building Tetris Foundations

Investigate the HTML5 [canvas](http://www.html5canvastutorials.com/) tag to build the 7 different Tetris game shapes. Display them somewhere on the canvas as a staging area. Outline a separate area in the canvas as the game area.

Allow the user to [drag one of the shapes](https://jsfiddle.net/davidbarszczak/EnZEa/) from the staging area to the game area. As soon as the user lets go of the mouse button, the shape should start moving towards the bottom of the game area.

> Fun stuff with Canvas: [21 Canvas Experiments](http://code.tutsplus.com/articles/21-ridiculously-impressive-html5-canvas-experiments--net-14210)
