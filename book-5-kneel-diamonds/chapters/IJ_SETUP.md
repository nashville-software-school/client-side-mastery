# Meeting Dr. Henrietta Jones - Urbanologist

Dr. Henrietta Jones is a prominent urbanologist who works for the University of Indianapolis. When she is not working on her regular coursework of teaching classes about urbanology and the history of urban life in the United States, she is out in the field trying to find lost artifacts from ancient, or abandoned, cities of the US.

Unfortunately, Dr. Jones is required, every year, to do research work and publish papers on her work in order to keep her good standing with the university. Her most recent research involves understanding the relationship of the history of the blue jean with the rise of the urban lifestyle.

To start, she's going to send a survey to students at all Indiana universities, her's included, to collect data on if the student owns a pair a blue jeans, the cost of the garment, and if the student lives in an urban or rural area.

She calls the study **"Indiana Jeans"**.

She wants you to design the survey as a web application so that students can have a web page to go to.

## Project Setup

Create the following directory and files.

```sh
mkdir ~/workspace/indiana-jeans
cd ~/workspace/indiana-jeans
mkdir styles scripts api
touch index.html styles/main.css scripts/main.js api/database.json
```

Then open the directory in Visual Studio Code.
You should see the following file structure:

```
indiana-jeans/
│
├── api/
│   └── database.json
│
├── scripts/
│   └── main.js
│
├── styles/
│   └── main.css
│
└── index.html
```

### HTML

Add the following boiler plate code to your `index.html` file. 
```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/main.css" />
    <title>Indiana Jeans</title>
  </head>
  <body>
    <h1>Indiana Jeans Survey</h1>
    <main id="container"></main>

    <script type="module" src="scripts/main.js"></script>
  </body>
</html>
```

### 💡 Did you know?
In VSCode, there is a shortcut for creating HTML boilerplate code! Just type `!` in a blank `.html` file and hit enter. You will have a simple html boilerplate to get you started. Just don't forget to link your `.css` file in the `<head>` and add `<script type="module" src="scripts/main.js"></script>` in the `<body>`! It's also wise to give your document a proper `<title>`. 

### CSS

Feel free to get creative and make your own styles for this project! However if you would like styles provided for you, expand the code below and copy it into your `styles/main.css` file. 

<details>
    <summary>Expand to get the css code</summary>

```css
/* Indiana Jeans Survey Denim-Themed Stylesheet */

/* Base Styles and Typography */
:root {
  --denim-dark: #151e3f;
  --denim-medium: #28559a;
  --denim-light: #3778c2;
  --denim-faded: #ecf0f3;
  --denim-stitch: #f0c808;
  --denim-button: #ea3546;
}

body {
  font-family: "Helvetica Neue", Arial, sans-serif;
  background-color: var(--denim-faded);
  color: var(--denim-dark);
  padding: 2rem;
  max-width: 900px;
  margin: 0 auto;
  line-height: 1.6;
}

h1,
h2 {
  font-family: "Georgia", serif;
  color: var(--denim-dark);
}

h1 {
  font-size: 2.5rem;
  text-align: center;
  margin-bottom: 2rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  border-bottom: 3px solid var(--denim-stitch);
  padding-bottom: 0.5rem;
}

/* Main Container Styling */
#container {
  background: white;
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  position: relative;

  /* Denim texture */
  background-image: linear-gradient(
      45deg,
      var(--denim-faded) 25%,
      transparent 25%
    ),
    linear-gradient(-45deg, var(--denim-faded) 25%, transparent 25%),
    linear-gradient(45deg, transparent 75%, var(--denim-faded) 75%),
    linear-gradient(-45deg, transparent 75%, var(--denim-faded) 75%);
  background-size: 20px 20px;
  background-position: 0 0, 0 10px, 10px -10px, -10px 0px;
}

#container::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(255, 255, 255, 0.9);
  z-index: -1;
  border-radius: 8px;
}

/* Survey Input Sections */
.survey-input {
  margin-bottom: 2rem;
  padding: 1.5rem;
  border: 2px solid var(--denim-medium);
  border-radius: 6px;
  background: white;
  position: relative;

  /* Denim stitch effect on borders */
  background-image: repeating-linear-gradient(
    0deg,
    var(--denim-stitch),
    var(--denim-stitch) 5px,
    transparent 5px,
    transparent 15px
  );
  background-size: 100% 2px;
  background-position: 0 0, 0 100%;
  background-repeat: no-repeat;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
}

.survey-input h2 {
  margin-top: 0;
  font-size: 1.5rem;
  color: var(--denim-medium);
}

/* Radio buttons and form elements */
input[type="radio"] {
  margin-right: 0.5rem;
  margin-left: 1.5rem;
  transform: scale(1.2);
  accent-color: var(--denim-medium);
}

input[type="radio"]:first-of-type {
  margin-left: 0;
}

/* Submission Button */
#submission-button {
  background-color: var(--denim-button);
  color: white;
  border: none;
  padding: 0.8rem 2rem;
  font-size: 1rem;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  transition: all 0.3s ease;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  display: block;
  margin: 2rem auto;
}

#submission-button:hover {
  background-color: #d52b3c;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#submission-button:active {
  transform: translateY(0);
}

/* Survey Submissions List */
#survey-submissions-list {
  margin-top: 3rem;
  padding-top: 1rem;
  border-top: 3px dashed var(--denim-medium);
}

#survey-submissions-list h2 {
  text-align: center;
  margin-bottom: 1.5rem;
  color: var(--denim-dark);
}

.survey-submission-container {
  background-color: white;
  border-left: 5px solid var(--denim-stitch);
  padding: 1rem 1.5rem;
  margin-bottom: 1rem;
  border-radius: 0 4px 4px 0;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
  transition: transform 0.2s ease;
}

.survey-submission-container:hover {
  transform: translateX(5px);
}

.survey-submission-container h2 {
  font-size: 1.2rem;
  margin: 0 0 0.5rem 0;
  text-align: left;
}

.survey-submission-container p {
  margin: 0.5rem 0;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  body {
    padding: 1rem;
  }

  h1 {
    font-size: 2rem;
  }

  .survey-input {
    padding: 1rem;
  }
}
```    
</details>

