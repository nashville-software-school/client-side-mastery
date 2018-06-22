# Expressing State as HTML

This chapter isn't very technical, but is intended to help you understand a **very** important aspect of learning React.

Gone are the days of using Vanilla JavaScript or jQuery to directly manipulate your DOM. You should never write an `appendChild()`, or `$("#something").empty()` in your code.

State is at the core of React. It drives everything. Including the HTML representation of that state via JSX. If you want to change the DOM that is being displayed to your customer, you **change the state of the component**.

Always remember that by using the `this.setState()` method in a React component, that it, in turn, invokes the `render()` method. Therefore, changing state modifies your DOM.

* If you remove an item from a collection in state, then that element will not be rendered.
* If you add an item to a collection in state, then it will be rendered.
* If you modify an object that is used in your JSX, then it will be changed when the component is re-rendered.
