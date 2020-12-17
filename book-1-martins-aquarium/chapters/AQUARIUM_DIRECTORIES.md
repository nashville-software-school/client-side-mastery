# Directories for Different Types

Professional developers do not store all of their application code in a single directory. They create subdirectories to store files that have common responsibilities. For the aquarium project, you are going to put all of your CSS code into a `styles` subdirectory of your project.

## Styles Directory

```sh
cd ~/workspace/aquarium
mkdir styles
mkdir styles/main
mkdir styles/locations
```

Then move all CSS files into that directory with the `mv` command. The pattern is always the following.

> **TIP:** When you see curly braces like this in documentation, it usually means _"place your text here, but without the curly braces"_

```html
mv {what you want to move} {where you want to move it}
```

Here's an example of how to move the `main.css` file into the `styles/main` subdirectory.

```sh
mv main.css styles/main
```

1. Move all of the CSS files for the home page into the `styles/main` subdirectory.
1. Move all of the CSS files for the locations page into the `styles/locations` subdirectory.