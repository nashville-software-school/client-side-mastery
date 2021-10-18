# Automating the World

Your task in this group project is to use your newfound skills of automation, and rebuild your travel brochure site using objects, arrays, components, modules, CSS selectors, Flexbox, semantic HTML, and data providers. Each Team will choose four new countries.

Each city, each landmark, and each famous citizen must be represented in application state as objects. This means that you will need multiple separate data providers, list components, and HTML representation components for each page.

A suggestion is to create multiple sub-directories under `scripts`. If, for example, your team chose Turkey, Morocco, Tanzania, and Indonesia, you would have the following main modules.

> **Note:** Do not make any properties on your resources that involve presentation - like class names, or HTML tags. Only the properties of the resource should be on each object.

```sh
mkdir scripts/turkey
mkdir scripts/morocco
mkdir scripts/tanzania
mkdir scripts/indonesia

touch scripts/indonesia/main.js
touch scripts/turkey/main.js
touch scripts/morocco/main.js
touch scripts/tanzania/main.js
```

To organize your files even more, you could create three sub-directories in each of the city directories.

```sh
mkdir scripts/morocco/cities
touch scripts/morocco/cities/CityDataProvider.js

mkdir scripts/morocco/landmarks
touch scripts/morocco/landmarks/LandmarkDataProvider.js

mkdir scripts/morocco/celebrities
touch scripts/morocco/celebrities/CelebritiesDataProvider.js
```
