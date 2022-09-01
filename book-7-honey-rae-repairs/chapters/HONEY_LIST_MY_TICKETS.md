# Displaying The Right Tickets

This section shows you how to implement another state variable with `useState()` and how to observe ticket state with `useEffect()`. You will see how to display all tickets if an employee is logged in, but only the customer's tickets when a customer in logged in.

Watch the [Filtered State Depending On User Type](https://watch.screencastify.com/v/wH8Ia30YWlatzYj8spXg) video and then implement the code yourself.

# Key Concept Clips

| Time | Concept |
| --- | ----------- |
|  1:05 | Basic authentication |
|  4:00 | Getting logged in user object from local storage in application dev panel|
|  4:45 | useEffect with dependency array to observe state variable change |
|  8:01 | Filter array method to set new secondary state variable |
| 10:05 | JSX to render new secondary state variable |


## Removing Key Warning

After you are done implementing the code for filtering tickets by user, you may notice a waraning in your Console dev panel that says...

```
Warning: Each child in a list should have a unique "key" prop.
```

Watch this short [Honey Rae: React 18: Unique Key Prop](https://watch.screencastify.com/v/dShXYcOgb1aoMyBM7bpp) video to see how to stop getting that warning
