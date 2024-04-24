# Authorizing Users
In this chapter you will set up your Honey Rae's application for user authentication. The authentication functionality is provided for you as it is not a learning objective of this course.

In the root of your project in the terminal, run the script below.
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/repair-auth.sh)"
```

## 📺 Watch the videos

### ⚠️ Note on the video:
This video instructs you to make the file `components/welcome/Welcome.js`. Make sure your file ends in `.jsx` instead of `.js`.

Watch the [authentication setup](https://youtu.be/nDGJUeN1biY?si=HZmcMzjb-7Xu_mzW) video and implement the code yourself. Once you have successfully set up authentication for your Honey Rae's project, watch the [Claim vs Close](https://youtu.be/4OVltZMwbzc?si=oXNsN101p77BTwOB) video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.

<details>
  <summary>Logout NavBar item</summary>

  ```jsx
  {localStorage.getItem("honey_user") ? (
    <li className="navbar-item navbar-logout">
      <Link
        className="navbar-link"
        to=""
        onClick={() => {
          localStorage.removeItem("honey_user")
          navigate("/", { replace: true })
        }}
      >
        Logout
      </Link>
    </li>
  ) : (
    ""
  )}
  ```
</details>

### 🔸🔻🔹 CSS for this chapter
<details>
  <summary>Tickets.css</summary>

  ```css
  .btn-container {
    display: flex;
    justify-content: flex-end;
  }
  ```
</details>

## Prop Drilling
In this chapter we defined a new state variable to hold the logged in user. We defined this state in the `ApplicationViews` component so that we can pass the current user down to any component that needs it. We encountered this when writing the logic for the **Claim** and **Close** buttons for each ticket. We needed to know the `id` and `isStaff` value of the user when deciding which button, if any, the user should see on a ticket.

In order to provide the `currentUser` state to the `Ticket` component, we has to pass it down from `ApplicationViews` to `TicketList` and from `TicketList` to `Ticket`. Passing props down multiple levels like this is called ***prop drilling***. It can be messy and hard to follow and there are advanced, better ways around this. But it's likely, if you're working on a legacy React application, that you will run into this on the job.

Up Next: [Editing an employee](./REPAIR_EMPLOYEE_EDIT.md)