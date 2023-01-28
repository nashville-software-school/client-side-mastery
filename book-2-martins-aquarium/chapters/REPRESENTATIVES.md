# Congressional Representative

## Getting Started

1. Make a new project directory in workspace
    ```sh
    cd ~/workspace
    mkdir congress
    ```
2. Navigate to your project directory
    ```sh
    cd congress
    ```
3. Type in the `git init` command
4. You now have a git repository for tracking your progress


## Boilerplate Code

1. Create an `index.html` file in your project directory and paste the following code into it.
   <details>
      <summary>Expand to get the HTML</summary>

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>Nashville Coffee Houses</title>
       <link rel="stylesheet" href="styles/main.css">
     </head>
     <body>
   	<header class="pageHeader">Congressional Representative</header>

       <section class="list">
         <article class="shop">The Jam</article>
         <article class="shop">The Well</article>
         <article class="shop">Red Bicycle</article>
         <article class="shop">Crema</article>
         <article class="shop">Frothy Monkey</article>
         <article class="shop">8th &amp; Roast</article>
         <article class="shop">Bongo Java</article>
         <article class="shop">Flatrock</article>
         <article class="shop">Fido</article>
         <article class="shop">Steadfast Coffee</article>
         <article class="shop">Dose Coffee</article>
         <article class="shop">Sam &amp; Zoes</article>
         <article class="shop">Slow Hand Coffee</article>
         <article class="shop">The Horn</article>
       </section>
     </body>
   </html>
   ```
   </details>
2. Add a sub-directory in your project named **styles**.
3. Create a `main.css` file in the **styles** directory.
4. In the **congress** directory in your terminal, run the `serve` command to start your web server. Make sure you are not in your **styles** directory when you do this. Also make sure you are not in your **workspace** directory.

After you run `serve` a URL will be displayed in your terminal. Copy pasta that URL into your browser.

```sh
   ┌────────────────────────────────────────────────────┐
   │                                                    │
   │   Serving!                                         │
   │                                                    │
   │   - Local:            http://localhost:3000        │
   │   - On Your Network:  http://192.168.68.113:3000   │
   │                                                    │
   │   Copied local address to clipboard!               │
   │                                                    │
   └────────────────────────────────────────────────────┘
```

## Description

You're going to create an HTML component to represent a political candidate. Specifically, the representative of your Congressional district. Visit the GovTrack site link below, enter in your home address, and you'll find basic information about your representative.

[GovTrack - Congressional District Map](https://www.govtrack.us/congress/members/map)

1. In your HTML, create an `article` element that will serve as your main representative component. Give the element a unique identifier.
1. In this component, create a sub-component for basic information using the `section` element. In this section create elements for the representative's image, name, district info, and political affiliation.
1. Beneath the basic information, you will create a sub-component, using a `section` element, to list any committees the candidate is serving on.
1. The last component will hold links to any legislation that your representative has enacted.

Make sure you use good BEM-style class names for each element in your components. Put a comment above each component explaining what it is.


## Additional References

This is supplementary content. It is not required, but is for your additional learning if you wish.

1. [HTML Semantic Tag Cheatsheet](https://learn-the-web.algonquindesign.ca/topics/html-semantics-cheat-sheet/)
1. [CSS Tricks - Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
1. [CSS Tricks - BEM](https://css-tricks.com/bem-101/)
1. [Introduction to BEM - A front-end methodology](https://www.youtube.com/watch?v=IO-4Z32O--c)
