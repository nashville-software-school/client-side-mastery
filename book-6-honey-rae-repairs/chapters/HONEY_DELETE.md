# Deleting Service Tickets

Sometimes, Honey Rae's staff just doesn't have the expertise to work on a service request. In those situations, someone on staff will contact the customer to let her know that it can't be completed. Then, someone on staff will delete the service request from the database.

## Delete Function

Add a function to the **TicketList** module named `deleteTicket()`. In that function you will have a fetch call with the DELETE method specified.

```js
const deleteTicket = (id) => {
    fetch(`http://localhost:8088/serviceTickets/${id}`, {
        method: "DELETE"
    })
}
```

## Delete Button

In your JSX, add a button labeled "Delete" next to each service request.

```jsx
<button onClick={() => {
    deleteTicket(ticket.id)
}}>Delete</button>
```

## First Attempt

Now click the delete button next to a request. Make sure you have your Network tab open to you can see the request/response for your fetch call. You should get a successful 200 response from the API.

<img src="./images/honey-rae-initial-delete.gif" alt="animation showing a successful delete operation" width="800px" />

## Out of Sync

However, you will notice that the service ticket still appears in the list, even though it has been successfully removed from permanent state. The state of the API has been changed, but the state of your application has not been updated - so they are now out of sync.

After the DELETE operation is successful, you need to GET all of the service tickets again, and render the new state. The problem is that you currently have the fetch call inside of your `useEffect()` method. There's no way to call that again without duplicating the code, which you should now know is a bad idea.

Think about how to solve this, and discuss with your teammates. As always, your instructional team will help get you where you need to go if you and your peers can't figure it out.
