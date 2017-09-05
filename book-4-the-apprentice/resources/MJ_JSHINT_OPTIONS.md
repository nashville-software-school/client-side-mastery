### JSHint Options

When you use the jshint library to check your JavaScript syntax, you can establish defaults that it will use during validation. You can put those defaults in the root directory of your project, and jshint will read the configuration when it runs.

Create a `.jshintrc` in the root directory of your project and paste in the following configuration object.

* `predef` lists global variables that are predefined by the browser, or third-party libraries that should be accepted when validating.
* `globalstrict` will stop jshint from complaining when you have "use strict"; at the top of a JavaScript file.
* `curly` will make jshint complain when there is a `if`, `for`, or `while` block that is not contained within curly braces.
* `eqeqeq` enforces that === is always used for comparison.
* `undef` prohibits the use of explicitly undeclared variables.
* `globals` is used to specify a white list of global variables that are not formally defined in the source code.

```json
{
  "predef": [ "document", "console", "angular", "require" ],
  "esversion": 6,
  "globalstrict": true,
  "curly": true,
  "eqeqeq": true,
  "undef": true,
  "unused": true,
  "globals": {
    "SomeGlobalVariableYouWantToUse": true
  }
}
```