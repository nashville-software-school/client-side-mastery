# Search Tickets
In this chapter you will practice what you learned in the previous chapters by implementing a search bar for the tickets.

## 📺 Watch The Video

### ⚠️ Note on the video: 
This video instructs you to make the file `components/TicketFilterBar.js`. Make sure your file ends in `.jsx` instead of `.js`.u

Watch the [Search Tickets](https://youtu.be/WPG09-cUJYg?si=sYHT7adRJVgaL0qr) video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.

### 🔸🔻🔹 CSS for this chapter
<details>
  <summary>Tickets.css</summary>

  ```css
    .ticket-search {
      padding: 0.375rem 0.75rem;
      font-size: 1rem;
      border: 1px solid var(--outline);
      border-radius: 0.25rem;
      margin-left: auto;
    }

    .filter-bar {
      display: flex;
    }
  ```
</details>

## Missing Dependencies
When we created the useEffect to watch for the searchTerm state change, we saw a green squiggly (if Eslint is installed) under our dependency array. This isn't an error but more of a warning that this code _might_ cause a bug. 
```sh
React Hook useEffect has a missing dependency: 'allTickets'. 
```
The reason for this warning is that in our callback function we're using a variable that is not in our dependency array. 
```javascript
useEffect(() => {
    const foundTickets = allTickets.filter((ticket) =>
      ticket.description.toLowerCase().includes(searchTerm.toLocaleLowerCase())
    )
    setFilteredTickets(foundTickets)
  }, [searchTerm])
```
Though the point of this useEffect is to _watch_ for whenever the searchTerm changes so that we can filter our tickets, we are _depending_ on the allTickets state. 

Not including `allTickets` in the dependency array may not cause any problems, but Eslint sees it as a potential bug. What if the value of allTickets changes? You may want to rerun this function this function if it does. 

The “React Hook useEffect has a missing dependency” error is a common issue faced by React developers when working with the useEffect hook.

When fixing the error, it’s important to consider your specific use case. Try to address the issue by including the missing dependency in the dependency array or ignore it if you're certain it's not needed. 

However, if you run into some tricky bugs while developing your react application, it's very likely you do have a missing dependency. Try installing [Eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) if you haven't already to help you find these tricky bugs.

Up Next: [Listing the customers](./REPAIR_CUSTOMER_LIST.md)