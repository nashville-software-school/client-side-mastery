# Final Challenge: Tracking the Money

Use `fetch` to get all of the related data to build a card for each politician. It should list the bills they have sponsored, and any companies that have contributed to a PAC that has a shared interest for each bill.

> **HINT:** We will give you **one** hint. You will need to use the [`Promise.all()`](https://attacomsian.com/blog/promise-all-javascript) method to [resolve multiple fetch](https://appdividend.com/2019/01/03/javascript-promise-all-example-promise-all-tutorial/) calls at the same time.

```html
<article class="politicians">
    <section>
        <header class="politician__name">
            <h1>Charlene Harding</h1>
        </header>
        <div class="politician__info">
            <div>Age: 45</div>
            <div>Represents: Bethpage, Maine</div>
        </div>
        <div class="politician__bills">
            <h3>Sponsored Bills</h3>
            <div>
                <h4>H.R. 5215: Veterans Affairs Purchase Card Misuse Mitigation Act</h4>
                <ul>
                    <li>Military</li>
                </ul>
            </div>
        </div>
        <div class="politician__funders">
            <h3>Related PACs</h3>
            <ul>
                <li>American Gas Association</li>
                <li>League of Conservation Voters Action Fund</li>
            </ul>
        </div>
        <div class="politician__influencers">
            <h3>Influencing Corporations</h3>
            <ul>
                <li>Lockheed Martin</li>
                <li>Boeing</li>
            </ul>
        </div>
    </section>
</article>
```

![animation of some rendered politicians](./images/honest-abe.gif)