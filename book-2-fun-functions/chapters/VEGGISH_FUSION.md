# The Fish Restaurant

## Importing Functions

Since the restaurant needs to see which fish are available at the foshmonger marjet, it will need to import the function that is exported from that module.

## Restaurant Menu

This module must import and invoke the function that is exported by the fish monger module. This module should also define a function that build an HTML version of their daily menu. The function should return the generated HTML string. The function must be named `fishMenu`.

1. Each day, the chef visits the monger and specifies the maximum price she is able to spedn per fish.
1. If the monger has any fish at that price point or less, the chef buys 50% of the existing inventory.
1. The chef then creates 3 different meals per fish - a soup, a grilled dinner, and sandwich. For example, if tuna was bought, the following meals will be on the menu.
    * Tuna Soup
    * Tuna Sandwich
    * Grilled Tuna
1. Your HTML structure must match the example below. Use the same elements and the same class names.
    ```html
    <h1>Menu</h1>
    <article class="menu">
        <h2>Tuna</h2>
        <section class="menu__item">Tuna Soup</section>
        <section class="menu__item">Tuna Sandwich</section>
        <section class="menu__item">Grilled Tuna</section>
    </article>
    ```

## Algorithm

Open your `restaurant.js` module and write some comments describing the operations, data structures, function, and parameters needed to fulfill the above requirements.

Now implement the algorithm as best you can.