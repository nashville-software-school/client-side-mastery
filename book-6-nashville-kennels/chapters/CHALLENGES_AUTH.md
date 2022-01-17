## Practice: Change the view once the user logs in

Once a user logs in, redirect them to the `home` route. You will need to refactor the `login` route. With routes, consider when you will need to use `component` vs `render` and the use of `{...props}`.

## Challenge: No Animal ID in API

What if an animalId is no longer available in the API? Write a conditional to display something different if an animal(user, employee or location) is not available/valid.

## Challenge: Active NavBar Route

In the NavBar, highlight the active section. For example, if you are viewing `Animals`, change the `<NavBar>` Animals link to `lime` (you could also disable the ability to click). Since the `<NavBar` is not part of a route, you will need to `export default withRouter(NavBar)` in order to have access to the router location properties.


## Fun Challenge: Remember Me

1. Add a checkbox beneath the login form labeled _Remember Me_.
2. When the customer logs in and the checkbox is not checked, then save their information to session storage
3. When the customer logs in and the checkbox is checked, then save their information to local storage
4. **Tip** You will need to store the value of the checkbox in state.