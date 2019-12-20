# Final Challenge: Tracking the Money

Create an API using `json-server` for the resources you created above to track campaign contributions.

1. Create a `database.json` file containing all of the resources.
1. Define a few entries for each resource. Each resource must have a unique primary key.
1. Establish relationships between the resources by storing primary key values as foreign keys on related objects.
1. Run your API with the following command.
    ```sh
    json-server -w database.json -p 8088
    ```
1. Use `fetch` to get all of the related data to build a card for each politician. It should list the bills they have sponsored, and any companies that have contributed to a PAC that has a shared interest for each bill.

> **HINT:** We will give you **one** hint. You will need to use the [`Promise.all()`](https://attacomsian.com/blog/promise-all-javascript) method to [resolve multiple fetch](https://appdividend.com/2019/01/03/javascript-promise-all-example-promise-all-tutorial/) calls at the same time.

```html
<article class="politician">
    <header class="politician__name">
        <h1>Dyer Cummings</h1>
    </header>
    <section class="politician__bills">
        <h3>Sponsored Bills</h3>
        <div>
            <h4>H.R. 5215: Veterans Affairs Purchase Card Misuse Mitigation Act</h4>
            <ul>
                <li>Military</li>
            </ul>
        </div>
    </section>
    <section class="politician__funders">
        <h3>Related PACs</h3>
        <ul>
            <li>American Gas Association</li>
            <li>League of Conservation Voters Action Fund</li>
        </ul>
    </section>
    <section class="politician__influencers">
        <h3>Influencing Corporations</h3>
        <ul>
            <li>Lockheed Martin</li>
            <li>Boeing</li>
        </ul>
    </section>
</article>
```

![animation of some rendered politicians](./images/honest-abe.gif)