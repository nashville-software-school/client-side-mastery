# Automatically Loading Newly Created Submissions

In this chapter, you are going to learn a new super-power. You will generate your own, custom event in the browser. Up to this point, you have listened for events like **click** and **change**, but you did not have broadcast, or dispatch, the event yourself. The browser does that part for you.

Now you are going to handle both parts. You will dispatch the event that you create, and you will listen for it.

```js
// Define your very own event
const customEvent = new CustomEvent("franksFunkyEvent")

// Broadcast, or dispatch, the event
document.dispatchEvent(customEvent)
```

Watch the following video to see how you can implement a custom event to trigger the re-rendering of the HTML when a new submission has been successfuly sent to your local API and saved in permanent state.

[<img src="../../book-1-installations/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/0IpjcmmbJ53F3KYn1oyg)
