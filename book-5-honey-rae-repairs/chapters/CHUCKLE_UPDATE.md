# Marking a Joke as Told/Untold
In this chapter you will add a button to the jokes to either mark it as told or untold.

<img src="./images/chuckle-update.gif" width="1000px" alt="Animation showing a joke being marked as told and untold." />


<details>
  <summary><b>OPTIONAL FUN!</b></summary>

  ### Want those fun icons in your app?
  The icons in the animation are easy to implement! If you'd like to add them to your application, just sign up for Font Awesome [here](https://fontawesome.com/). Follow the "_start for free_" link, enter your email, and click "_send kit embed code_". Follow the steps to confirm your email address. You'll be redirected to a page with this script: 
  ```javascript
  <script src="YourUniqueFontAwesomeLink" crossorigin="anonymous"></script>
  ```

  Copy the script and add it to the `<head>` of the index.html file of your project. Now browse the icons library and choose which ones you want in your project. You can add them anywhere you would add text! For example, in the animation above, those icons are the text for a button that's been styled to have no border:

  ```jsx
  <button><i className="fa-regular fa-face-meh" /></button>
  ```
</details>

## Implementation

Try implementing this code on your own. If you get stuck, reference previous code or take a look at the hints below. 


<details>
  <summary><b><i>The Post</i></b></summary>

  You'll want to add and export a new function from `jokeService.jsx` to return a fetch call with the `PUT` method. This function should accept the edited joke object as a parameter.
</details>
<br>
<details>
  <summary><b><i>The Buttons</i></b></summary>

  A button should be added next to each joke in both lists. Where in the code are we generating some jsx for each joke? 🤔 
</details>
<br>
<details>
  <summary><b><i>The Action</i></b></summary>

  Write a function to pass to the `onClick` of the buttons. This function should accept a joke as a parameter. It's responsibility will be to create an editedJoke object to pass to the edit joke function from the `jokeService`. 
  All the property values should remain the same expect for the `told` property. If told is `true`, it should change to `false`. If told it `false`, it should change to `true`. _Remember the `!` operator will convert a value to it's opposite boolean._
  <br>
  Post that edited joke! Don't forget to get your new list of jokes from the database after posting.
</details>

Up Next: [Deleting chuckles](./CHUCKLE_DELETE.md)