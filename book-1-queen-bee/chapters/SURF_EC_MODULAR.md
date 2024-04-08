# More Modularity

Right now, if you run your `averagePrice.js` module, there are three different chunks of output that serve different needs. This is bad.

It would be better if there were three different modules, each with its own responsibility.

| Module | Responsibility |
| --- | --- |
| averagePrice.js | To output only the average price. |
| accounting.js | To output only the data needed for the accounting firm. |
| productReport.js | To output the details of the sale, and non-sale items. |

Your job is to make those modules and correctly define the imports needed for each one to run properly.
