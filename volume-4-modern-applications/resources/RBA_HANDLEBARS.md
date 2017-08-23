# :pushpin: Exercises

1. [Handlebars Blog](../exercises/RBA_HANDLESBARS_BLOG.md)

# Modular applications

You've learned the basics of making modules in JavaScript in order to make an application more flexible, more maintainable, and more extensible. Application developers love modularity, and you can also apply the same concept to your HTML markup.

# HTML 201 - Handlebars

Up until this point, you've been building DOM strings in your JavaScript, and then using jQuery to inject that string into your existing DOM. As you've discovered, this is clunky, hard to maintain, and prone to human error.

```js
var userInfo = "Current user: " + user.first_name + " " + user.last_name;
var widgetInfo "(" + widget.id + ") " + widget.product_name;

$("#container").append("<div>" + userInfo + "</div>");
$("#container").append("<div>" + widgetInfo + "</div>");
```

Now, you're going to completely reverse the responsiblity. No longer are you going to use JavaScript to build DOM. Rather, you're going to build HTML and pull in JavaScript variables.

You'll be using a JavaScript library called [Handlebars](http://handlebarsjs.com/) to accomplish this.
Here's a gentle [introduction](https://drive.google.com/open?id=1Adva2LiT-_z6vu_R3RyPML2FP0tMc9aS0g8MNhTIplw) in a slide deck.

# Handlebars Part 1

Run the following commands.

```
mkdir ~/workspace/handlebars && cd $_ #If you've switched to running from host machine
touch index.html

mkdir javascripts
touch javascripts/main.js

bower install jquery
bower install handlebars
```

## Setup

### HTML templates

First, write some DOM in your `index.html` file.

##### index.html

---

```html
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>NSS Starter Kit - Handlebars</title>
</head>

<body>

  <div id="article-output"></div>

  <script id="article-template" type="text/x-handlebars-template">
    <div class="article article__container">
      <h1>{{articleTitle}}</h1>
      <div class="article__text">
        {{articleText}}
      </div>
    </div>

    <ul>
    {{#each tags}}
      <li>{{category}}:{{name}}</li>
    {{/each}}
    </ul>
  </script>

  <script type="text/javascript" src="bower_components/jquery/dist/jquery.min.js"></script>
  <script type="text/javascript" src="bower_components/handlebars/handlebars.min.js"></script>
  <script type="text/javascript" src="javascripts/main.js"></script>

</body>
</html>

```

The double curly braces that are inside your HTML is specifying which JavaScript variable's value should be inserted at that location. This is called interpolation.

This code is telling Handlebars to evaluate the data object that is bound to it, find the key named `title` and put its value between the `<h1>` tags.

```
<h1>{{title}}</h1>
```

### JavaScript data objects

Now you are going to create a POJO (plain old JavaScript object) that will be "bound" to a template.

##### main.js

---

```js
// Define an object to hold the data for a template
var entryData = {
  title: "My New Post",
  body: "This is my first post!",
  tags: [
    {category: "technology", name: "handlebars"},
    {category: "author", name: "steve"}
  ]
};

// Grab the HTML from the appropriate <script> tag in index.html
var entryHTML = $("#entry-template").html();

// Use Handlebars to compile it into a template. Once it's a
// Handlebars template, you can bind data to it.
var entryTemplate = Handlebars.compile(entryHTML);

// Render the resulting HTML by passing the data to the template
var entryOutput = entryTemplate(entryData);

// Now take the final, compiled HTML and inject it into your DOM
$("#entryOutput").append(entryOutput);
```

## Partials

A partial is a special template that can be included in other templates. A good example would be social sharing buttons that you see on a lot of sites that produce content. By creating a partial, you can then inject that DOM after articles, after comments, really anywhere that you want those affordances to appear.

Here's how you include a partial named `sharingButtons` into another template.

```html
<script id="entry-template" type="text/x-handlebars-template">
  <div class="article article__container">
    <h1>{{articleTitle}}</h1>
    <div class="article__text">
      {{articleText}}
    </div>
    <div class="social-sharing">
      {{> sharingButtons}} <!-- this is a partial -->
    </div>
  </div>
</script>
```

Now you can define that partial as another template in `index.html`.

```html
<script id="social-sharing" type="text/x-handlebars-template">
  <div class="sharing sharing__container">
    <span class="sharing__button">
      <a href="{{ site_url }}">{{ site_name }}</a>
    </span>
  </div>
</script>
```

In your JavaScript, just add a POJO like for any other template, but the code is slightly different. You have to use the `registerPartial` method provided by Handlebars.

```js
var socialData = {
  site_url: "http://www.facebook.com",
  site_name: "Facebook"
};

// Get a reference to the partial's HTML template with jQuery
var socialPartial = $("#social-sharing").html();

// Compile it into a Handlebar template
var compiledPartial = Handlebars.compile(socialPartial);

// Bind the POJO to it
var partialFinalHTML = compiledPartial(socialData);

// Register the partial so that other templates can use it
Handlebars.registerPartial("sharingButtons", partialFinalHTML);
```

## Helpers

Handlebars provides [logical block helpers](http://handlebarsjs.com/block_helpers.html) right out of the box, and it also allows you to write your own, custom helpers to make your templates more intelligent.

### Built-in helpers

### each

See above example to see how to loop over a variable that is an array of objects.

### if-else

> **Scenario**: You have a template to display user information, but users can either be regular or expert. Each user has an `expert` variable that can be **true** or **false**. If the user is an expert, you want to display their name in bold with the word *Expert* next to it. Otherwise, just use the regular font.

You can use the `if-else` helper that Handlebars provides to evaluate a variable, and then output one set of DOM if the condition is true, and different DOM if it is false.

```html

<div id="user-output"></div>

<script id="user-template" type="text/x-handlebars-template">
  <div class="user user__container">
    <div>
      {{#if expert}}
        <span class="user__name--expert">
          {{ first_name }} {{ last_name }} (Expert)
        </span>
      {{else}}
        <span class="user__name--regular">
          {{ first_name }} {{ last_name }}
        </span>
      {{/if}}
    </div>
  </div>
</script>
```

##### user.js

```js
var user = {
  first_name: "Abraham",
  last_name: "Ybromovitz",
  expert: true
};

var userPartial = $("#user-template").html();
var compiledPartial = Handlebars.compile(userPartial);
var finalUserHTML = compiledPartial(user);
$("#user-output").html(finalUserHTML);

// You can combine all of those statements into a single
// statement, but you lose code clarity, and it's impossible
// to debug, so don't do this...
//
// $("#user-output").html(Handlebars.compile($("#user-template").html())(user));
```


##### main.css

```css
.user_name--expert {
  font-weight: bold;
}
```

### Custom helpers

You can write your own helpers to provide more intelligent capabilities to your templates. Here's a simplistic example helper that ensures that each each item in an array is put into an unordered list.

You will label the helper as `list` and then use it just like the built-in helpers, inside double curly braces.

```html
{{#list nav}}
  <a href="{{url}}">{{title}}</a>
{{/list}}
```

Then, in your JavaScript file, author a helper.

```js
Handlebars.registerHelper('list', function(context, options) {
  var ret = "<ul>";

  for(var i=0, j=context.length; i<j; i++) {
    ret = ret + "<li>" + options.fn(context[i]) + "</li>";
  }

  return ret + "</ul>";
});
```


# Handlebars Part 2

Once an application reaches any level beyond basic complexity, placing all of your Handlebar templates into the main `index.html` file becomes a nightmare to maintain. It would be preferable to create individual html files and then load them asynchronously and then render the results in the DOM.

Copy the code and place it in a new file named `javascripts/HandlebarRenderer.js`.

```js
function HandlebarRenderer () {
  this.cache = {};
};

HandlebarRenderer.prototype.load = function (tplName, tplData, cb) {
  var renderedHTML, compiledTemplate;

  if ( !this.isCached(tplName) ) {
    var templateDirectory = '/templates';
    var tplUrl = templateDirectory + '/' + tplName + '.html';

    console.log(`Loading ${tplName} template`);

    $.ajax({
      url: tplUrl
    }).done(function ( data ) {
      this.cache[tplName] = data;
      compiledTemplate = Handlebars.compile(data);
      renderedHTML = compiledTemplate(tplData);
      cb(renderedHTML);
    }.bind(this));

  } else {
    this.loadFromCache(tplName, tplData, cb);
  }
};

HandlebarRenderer.prototype.loadPartial = function (tplName, partialData, cb) {
  var renderedHTML, compiledTemplate;


  if ( !this.isCached(tplName) ) {
    var partialDirectory = '/templates/partials';
    var tplUrl = partialDirectory + '/' + tplName + '.html';

    console.log(`Loading ${tplName} partial`);

    $.ajax({
      url: tplUrl
    }).done(function ( data ) {
      this.cache[tplName] = data;
      compiledTemplate = Handlebars.compile(data);
      renderedHTML = compiledTemplate(partialData);
      Handlebars.registerPartial(tplName, renderedHTML)
    }.bind(this));

  } else {
    this.loadFromCache(tplName, tplData, cb);
  }
};

HandlebarRenderer.prototype.loadFromCache = function (tplName, tplData, cb) {
  var renderedHTML, compiledTemplate;

  console.log(`Pulling ${tplName} template from cache`);

  compiledTemplate = Handlebars.compile(this.cache[tplName]);
  renderedHTML = compiledTemplate(tplData);
  cb(renderedHTML);
};

HandlebarRenderer.prototype.isCached = function (tplName) {
  return this.cache[tplName];
};
```

Include it in your HTML file.

##### dymamic.html

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>NSS Starter Kit - Handlebars</title>
</head>

<body>
  <div id="articlesOutput"></div>
  <div id="ssOutput"></div>

  <script src="bower_components/jquery/dist/jquery.min.js"></script>
  <script src="bower_components/handlebars/handlebars.min.js"></script>
  <script src="javascripts/HandlebarRenderer.js"></script>
  <script src="javascripts/dynamic.js"></script>
</body>
</html>
```

Then you can move templates into files.

##### templates/article.html

```html
<div class="entry">
  <h1>{{title}}</h1>
  <div class="body">
    {{body}}
  </div>
</div>

<ul>
{{#each tags}}
  <li>{{category}}:{{name}}</li>
{{/each}}
</ul>
```

##### templates/solarSystem.html

```html
<h1>The Solar System</h1>
<ul>
{{#each planets}}
  <li>{{name}} is a {{type}} planet (index {{@key}} in the array)</li>
{{/each}}
</ul>
```

Now in your JavaScript, you can use that module.

##### dynamic.js

```js
// Create a new instance of the Handlebar loader
var render = new HandlebarRenderer();

// Tagline partial data
var taglineData = {
  author_first_name: "Steve",
  author_last_name: "Brownlee",
  authored_date: "January 29, 2015"
};

// Register the tagline partial for use in other templates
render.loadPartial('tagLine', taglineData, function (output) {
  console.log("partial output", output);
});


// Article data
var entryData = {
  title: "My New Post",
  body: "This is my first post!",
  tags: [
    {category: "technology", name: "handlebars"},
    {category: "author", name: "steve"}
  ]
};

// Load the article template and bind data to it
render.load('article', entryData, function (output) {
  $("#articlesOutput").html(output);
});


// Solar system data
var solarSystemData = {
  planets: [
    {type: "rocky", name: "Mercury"},
    {type: "rocky", name: "Venus"},
    {type: "rocky", name: "Earth"},
    {type: "rocky", name: "Mars"},
    {type: "gas giant", name: "Jupiter"},
    {type: "gas giant", name: "Saturn"},
    {type: "ice giant", name: "Uranus"},
    {type: "ice giant", name: "Neptune"}
  ]
};

// Load the solar system template and bind data to it
render.load('solarSystem', solarSystemData, function (output) {
  $("#ssOutput").html(output);
});
```

# Music History with Handlebars

## Using Handlebars in a Require app

1. Install the `require-handlebars-plugin` Bower components and show students how to call their Handlebar file in the the Require application with the `hbs!` prepend to the file path.

## Create a Handlebar template for your songs

1. Walk students through how to create a template directory and their first Handlebar file.

## Create handlebar templates for your filter form

Create two new templates to populate the artist and album dropdowns in the filter form.
