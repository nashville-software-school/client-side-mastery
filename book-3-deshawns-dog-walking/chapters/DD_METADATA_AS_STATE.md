# Metadata as State

Metadata is data about data. In the context of this project, metadata will be used to describe what _kind of data_ is being displayed.

* Each city list item will have a metadata attribute called `data-type` with a value of "city".
* Each walker list item will have a metadate attribute called `data-type` with a value of "walker".

These values aren't part of the actual data. For example, here's a walker object.

```js
{
    id: 5,
    name: "Elmira Bick",
    email: "ebick4@biblegateway.com",
    city: "Boise"
}
```

There is nothing intrinsic about this object that describes _what_ it is. It could be a generic person. It could be an employee. It could be a police officer.

It could be anything.

That's where metadata comes in. Data about data.

Watch the following video to see an implementation of metadata for your list items and then practice it in your code.

[<img src="../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://app.screencastify.com/v3/watch/KII3QjvTnTqeU4Zizmvv)


