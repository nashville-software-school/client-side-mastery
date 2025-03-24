# Indiana Jeans Component Function

In the last chapter, you created a static component function that generated HTML that was not a representation of anything in the database. In this chapter, you will create a dynamic component function by requesting data from the API running on your machine, and converting objects to HTML.

## Dynamic Component Function

Here is an example of a component function that dynamically builds HTML to represent data. It generate some HTML to represent the animals in a rescue shelter.

```js
export const ShelterAnimals = async () => {
    const response = await fetch("http://api.townsendshelter.com/animals")
    const animals = await response.json()

    let rescueList = "<ul>"

    for (const rescue of animals) {
        rescueList += `<li data-pk="${rescue.id}">${rescue.name}</li>`
    }

    rescueList += "</ul>"
}
```

Watch the following video for a walkthrough of creating the component that generates an HTML option for each location in the `socioLocations` collection in your API.

[<img src="../../book-1-installations/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/YsT8D4vrGbfdlPPbLFcY)
