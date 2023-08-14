# VanillaJS to React

In this chapter, you will be converting your VanillaJS component functions into React component functions. Much of the syntax is directly transferrable, but there are also subtle - but important - differences.

You will no longer be building string templates for your HTML. You will be building HTML objects using the JSX syntax. You will also see a special JSX element called a Fragment.

[<img src="../../book-0-installations/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/W4M5h99Ka8Z5v3TFBY3d)


| Term | Definition |
| --- | --- |
| JSX | **JavaScript XML** - a preprocessor step that adds XML syntax to JavaScript.<br/>[[Docs](https://react.dev/learn/writing-markup-with-jsx)] |
| Fragment | Allows you to group your JSX elements together in situations where you need a single element.<br/>[[Docs](https://react.dev/reference/react/Fragment)] |


## Example Code

The following code is what your React version of your **KneelDiamonds** component will look like. This is just the starting structure and doesn't contain any of the radio buttons groups. You will be creating those in the next chapter.

```js
export const KneelDiamonds = () => {

  return <>
    <h1>Kneel Diamonds</h1>

    <article className="choices">
      <section className="choices__metals options">
        <h2>Metals</h2>

      </section>
      <section className="choices__sizes options">
        <h2>Sizes</h2>

      </section>
      <section className="choices__styles options">
        <h2>Styles</h2>

      </section>
    </article>

    <article>
      <button id="orderButton">Create Custom Order</button>
    </article>

    <article className="customOrders">
      <h2>Custom Jewelry Orders</h2>

    </article>
  </>
}
```
