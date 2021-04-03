# Navigation and Routing

Install the React Router package in your Kandy Korner application. Then add a navigation bar component just like you did in Kennels. Also add an **`ApplicationViews`** component where you will set up the routes/views that your application will support.

Now refactor the application so that the navigation bar has a _Locations_ link, and a _Products_ link. When the user clicks on each one, only the corresponding resource should be listed.

In the end, your **`KandyKorner`** component should only render the navigation bar and the application view configuration module.

> ##### `src/components/KandyKorner.js`

```js
import React from "react"
import { Route } from "react-router-dom"
import { NavBar } from "./nav/NavBar"
import { ApplicationViews } from "./ApplicationViews"
import "./KandyKorner.css"

export const KandyKorner = () => (
    <NavBar />
    <ApplicationViews />
)
`