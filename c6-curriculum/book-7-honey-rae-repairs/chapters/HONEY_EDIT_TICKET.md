# Editing Tickets

In this chapter, you will use the following strategies that you've seen before.

1. Route parameters and `useParams()` hook
1. Defining default values on an initial state object, since you're building a form
1. Redirecting users and the `useNavigation()` hook
1. Using `useEffect()` to observe URL state _(i.e. the route parameter)_
1. HTTP requests with the `PUT` method to replace an existing resource in the API
1. Using the `onChange()` event listener to update state when the user interact with an input field

## Demo

<img src="./images/honey-rae-edit-ticket.gif" width="600px" alt="Animation showing a ticket being edited" />

## TicketEdit Component

Make the `src/components/tickets/TicketEdit.js` module and place the following code in it.

```js
export const TicketEdit = () => {
    return <></>
}
```

## Making Tickets Editable

Update **`TicketList`** JSX so that the ticket id is in the header, and is a `<Link>` component that routes the user to `/ticket/{id}/edit`

```html
<header>
    <Link to={`/tickets/${}/edit`}>Ticket {ticket.id}</Link>
</header>
<section>{ticket.description}</section>
<footer>Emergency: {ticket.emergency ? "🧨" : "No"}</footer>
```

## Defining the Edit Route

Add a route to the customer views that will render the **`TicketEdit`** component.

```html
<Route path="tickets/:ticketId/edit" element={ ??? } />
```


## Boilerplate Edit Form

Create a new module `src/components/tickets/TicketEdit.js`.

The edit form is, largely, the same as the **`TicketForm`** component. It has some important differences.

1. You need to **GET** the data based on the route parameter
1. The request to save the data is a **PUT** instead of a **POST**
1. The `checked` attribute of the checkbox must be bound to the `ticket.emergency` property

You can give it your best shot to transpose the code from **`TicketForm`** to **`TicketEdit`** and change it where needed, or you can snag the starter code below.

<details>
    <summary>Be lazy and copy this TicketEdit boilerplate code</summary>

```js
export const TicketEdit = () => {
    // TODO: This state object should not be blank
    const [ticket, assignTicket] = useState({})

    // TODO: What is the variable in which you stored the route parameter?
    const { ??? } = useParams()

    // TODO: Get the ticket state from the API.
    useEffect(() => {

    }, [ ??? ])

    const handleSaveButtonClick = (event) => {
        event.preventDefault()

        // TODO: Write the fetch for the PUT request to replace the object being edited
    }


    return <form className="ticketForm">
        <h2 className="ticketForm__title">Service Ticket</h2>
        <fieldset>
            <div className="form-group">
                <label htmlFor="description">Description:</label>
                <textarea
                    required autoFocus
                    type="text"
                    style={{
                        height: "10rem"
                    }}
                    className="form-control"
                    value={ticket.description}
                    onChange={
                        (evt) => {
                            // TODO: Update state with a modified copy
                        }
                    }>{ticket.description}</textarea>
            </div>
        </fieldset>
        <fieldset>
            <div className="form-group">
                <label htmlFor="name">Emergency:</label>
                <input type="checkbox"
                    onChange={
                        (evt) => {
                            // TODO: Update state with a modified copy
                        }
                    } />
            </div>
        </fieldset>
        <button
            onClick={() => handleSaveButtonClick()}
            className="btn btn-primary">
            Save Edits
        </button>
    </form>
}
```
</details>

## For the Truly Forlorn

If you just can't figure it out and have worked with your peers, then you can get the [working code](./scripts/TicketEdit.js) and put it in your component.
