## Elected Representatives (in theory)

In this exercise, you are going list politicians

### The Workforce ERD

Below is a JSON representation of a politician. Update your  **Politicians** resource in your ERD to have these properties.

```json
{
    "id": 1,
    "age": 45,
    "firstName": "Charlene",
    "lastName": "Harding",
    "phone": "+1 (941) 415-3565",
    "district": "Bethpage, Maine",
    "platform": "Laborum pariatur elit eiusmod voluptate. Anim sit eu magna reprehenderit do ea reprehenderit minim eu non aliquip laboris reprehenderit sint. In quis occaecat exercitation mollit sunt ut Lorem irure aute occaecat pariatur. Do in Lorem laborum anim. Sit ipsum ut tempor reprehenderit elit. Magna ut aute laboris esse irure id. Reprehenderit aliquip dolore cupidatat cillum sunt consectetur consequat dolore ullamco do voluptate sunt."
}
```

### HTML Representations

1. Create a `~/workspace/honest-abe` directory for this exercise.
1. Create an `api/database.json` file.
1. Copy the contents of the pre-built [honestabe.json](./data/honestabe.json) file into your `database.json`.
1. Create a provider, list, and individual component for politicians and list each one in the database.

The final HTML representation should look like this.

```html
<article class="politicians">
    <section class="politician">
        <header class="politician__name">
            <h1>Charlene Harding</h1>
        </header>
        <div class="politician__info">
            <div>Age: 45</div>
            <div>Represents: Bethpage, Maine</div>
        </div>
    </section>
</article>
```