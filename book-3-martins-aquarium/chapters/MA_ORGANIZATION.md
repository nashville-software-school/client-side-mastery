## Information Organization

In the following exercises, you are going to building module and components for tips, and locations. You need to separate all of those modules into sub-directories so that you don't end up with dozens of JavaScript files all in one directory. It's confusing.

In the `scripts` directory, create the `fish`, `tips`, and `locations` sub-directories and move all of your current files for automating fish into their `scripts/fish` directory.

This will have the side effect of changing how you import the modules, since their path has changed. You will need to clean up all of your import paths.
