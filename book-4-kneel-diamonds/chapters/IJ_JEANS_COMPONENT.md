# Indiana Jeans Component Function

Since Dr. Jones wants the survey takers to specify if they own a pair of jeans or not, our first component will produce the HTML to allow that choice to be made. This is one question on the survey, so it is one of the components of the overall survey.

You will have one module in the system to manage this question, and the function that will generate the HTML for it is called a component function.

## Static Component Function

Specifically, this first component will be a static component, which means that you will be manually building the HTML that you want to be injected into the DOM.

Here is a simple example of a static component. No fetch calls. No importing data from other modules. Just static, unchanging HTML.

```js
export const PageFooter = () => {
    let footerHTML = "<footer class='footer'>"
    footerHTML += "<span class='footer__copyright'>&copy; 2023 Acme, Inc</span>"
    footerHTML += "<span class='footer__address'>8088 Interface Ave</span>"
    footerHTML += "<span class='footer__map'>View us on Google Maps</span>"
    footerHTML += "</footer>"
}
```

Watch the following video for a walkthrough of how to do it. Then implement the code yourself.

[<img src="../../book-0-installations/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/GqHoMoTEjb8XBRHouTHA)
