# Organizational Directories

Here we are again. Our project directory now contains a mixture of HTML and JavaScript files. Time to clean up the mess.

## Scripts Directory

```sh
cd ~/workspace/aquarium
mkdir scripts
```

Then move all Javascript files into that directory with the `mv` command. The pattern is always the following.

> **TIP:** When you see curly braces like this in documentation, it usually means _"place your text here, but without the curly braces"_

```html
mv {what you want to move} {where you want to move it}
```

Here's an example of how to move the `main.js` file into the sub-directory.

```sh
mv main.js scripts
```

Move `dialog.js` into the sub-directory as well.