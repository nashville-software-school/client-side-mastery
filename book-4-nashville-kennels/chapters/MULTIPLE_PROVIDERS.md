# Joining Data in Multiple Resources

Sometimes we need data from multiple resources. For example, to add a new animal with dropdown options for both the locations and the customer.

In the next chapter we will create the AnimalForm component but first we need data from the location provider and customer provider. Update the **`ApplicationViews`** so the component has all the necessary providers as parent components.

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

Now the **`AnimalForm`** component can access data from all of the data providers to produce dropdown options.