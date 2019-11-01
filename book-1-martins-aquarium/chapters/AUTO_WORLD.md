# Automating the World

Your task in this group project is to use your newfound skills of automation, and rebuild your travel brochure site using objects, arrays, components, modules, dialogs, CSS selectors, Flexbox, data providers, and event listeners.

Each city, each landmark, and each head of state must be represented in application state as objects. This means that you will need three separate data providers for your application.

You will need three list components.

You will need three individual item components.

You will need three main components.

A suggestion is to create three sub-directories under `scripts`. If, for example, your team chose Turkey, Morocco, Tanzania, and Indonesia, you would have the following main modules.

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

mkdir scripts/morocco/leaders
touch scripts/morocco/leader/LeaderDataProvider.js
```