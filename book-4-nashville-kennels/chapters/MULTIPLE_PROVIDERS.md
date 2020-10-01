# Joining Data in Multiple Resources

Sometimes we need data from multiple resources. For example, to add a new animal with dropdown options for both the locations and the customer.

We will need data from the location provider and customer provider. The first step to making it work is updating **`ApplicationViews`** so the component has all necessary providers as parent components.

> ##### `src/components/ApplicationViews.js`

```jsx
<AnimalProvider>
    <LocationProvider>
        <CustomerProvider>
            <Route exact path="/animals/create">
                <AnimalForm />
            </Route>
        </CustomerProvider>
    </LocationProvider>
<AnimalProvider>

```

Now the **`AnimalForm`** component can access data from all of the data providers in to produce dropdown options.