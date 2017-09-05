# Using LiveReload

The Grunt `watch` task has a handy feature baked right into it. It's called livereload. By using it, you can force your browser to reload whenever any file that is being watched is changed.

* When you change SASS, it is transpiled into CSS and the browser reloads automatically so you can see your changes.
* When you change JavaScript, it is verified and the browser reloads automatically so the new logic is executed.

## Enabling livereload

Just add `livereload: true` to the watch configuration options object.

```js
watch: {
  options: {
    livereload: true,
  },
  javascripts: {
    files: ['./javascripts/**/*.js'],
    tasks: ['jshint']
  },
  sassy: {
    files: ['./sass/**/*.scss'],
    tasks: ['sass']
  }
}
```

Then link the corresponding JavaScript into your `index.html` file.

```html
<script src="//localhost:35729/livereload.js"></script>
```

This works because when you turn on livereload, the Grunt watch task starts a very lightweight process on port `35729` of your machine. Then, when any watch task completes, it triggers an event on that process.  The `livereload.js` file that you loaded is listening for that event, and when it happens, it triggers a browser reload.