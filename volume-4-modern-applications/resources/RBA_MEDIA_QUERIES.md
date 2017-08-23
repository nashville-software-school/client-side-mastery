# :pushpin: Exercises

1. [Music History 7](../exercises/MUSIC_HISTORY_07.md)

# CSS 201

## Mobile first CSS

### Media queries and media query listeners

> **Reference:** [Media Queries on MDN](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Media_queries)

Load styles based on media criteria. Thinking mobile first, specify the `min-width` value of the smallest device first and then work up from there.

##### index.html

```html
  <link rel="stylesheet" href="styles/responsive.css">
  
  <article class="colors">
    <span class="card-holder">
      <section class="first">Block A</section>
      <section class="second">Block B</section>
      <section class="third">Block C</section>
    </span>
  </article>
```

##### responsive.css

```css
article {
  text-align: center;
  font-size: 30px;
}

.first {
  background-color: cyan;
}

.second {
  background-color: yellow;
}

.third {
  background-color: magenta;
}

@media screen and (min-width: 320px) {
  .first, .second, .third {
    display: block;
    padding: 50px;
  }
}

@media screen and (min-width: 640px) {
  .first, .second, .third {
    display: inline-block;
    padding: 50px;
  }
}
```

### Grid-based layouts 

We'll be using [Bootstrap](http://getbootstrap.com/getting-started/) for our apps from this point on. There are some others that have become popular.

1. [Foundation](http://foundation.zurb.com/)
1. [Materialize](http://materializecss.com/)
1. [Skeleton](http://getskeleton.com/)
1. [Frameless](https://github.com/jonikorpi/Frameless)

Start a new playground directory named `responsive` and use Bower to install Bootstrap, and get the JavaScript and CSS linked in to the HTML file.


### Flexible images and media

1. [Fluid images](http://alistapart.com/article/fluid-images)
1. [Flexible images](http://webdesignerwall.com/tutorials/responsive-design-with-css3-media-queries)


## CSS pre-processing with SASS

Get SASS installed, show some examples, and then show how to use Grunt to compile SASS on file change.

1. Install Ruby (should exist for Mac and *nix machines)
1. Install SASS with `gem install sass`
1. In your Music History directory, create two new sub-directories: `sass` and `styles` (if you already have a directory for your CSS, just keep that).
1. Install the Grunt task that will compile SASS into CSS `npm install grunt-contrib-sass --save-dev`.

Update your Gruntfile to have the following contents

```js
module.exports = function(grunt) {

  grunt.initConfig({
    jshint: {
      files: ['../javascripts/**/*.js']
    },
    sass: {
      dist: {
        files: {
          '../styles/main.css': '../sass/main.scss'
        }
      }
    },
    watch: {
      javascripts: {
        files: ['../javascripts/**/*.js'],
        tasks: ['jshint']
      },
      sassy: {
        files: ['../sass/**/*.scss'],
        tasks: ['sass']
      }
    }
  });

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
  grunt.registerTask('default', ['jshint', 'sass', 'watch']);
};
```

1. Create the `sass/main.scss` file.
1. In that file, place the following code.

```sass
$font-stack:    Helvetica, sans-serif;
$primary-color: #333;

body {
  font: 100% $font-stack;
  color: $primary-color;
}
```

1. Run `grunt` and it will compile the `sass/main.scss` file as regular CSS in the `styles/main.css` file.

# Resources

## Animation libraries

1. [Mo.js](http://mojs.io/) - Spectaclular modern animation library
2. [jQuery](https://api.jquery.com/?ns0=1&s=animation) has many built-in animation methods.
3. [Move.js](https://visionmedia.github.io/move.js/) - A very small JS library for using animations without the need for jQuery
4. [three.js](http://threejs.org/) - The most popular library for 3D animations
