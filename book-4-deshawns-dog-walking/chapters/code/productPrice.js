document.addEventListener(
    "click",
    (clickEvent) => {
        const itemClicked = clickEvent.target
        if (itemClicked.id.startsWith("product")) {
            const [, productId] = itemClicked.id.split("--")

            for (const product of products) {
                if (product.id === parseInt()) {
                    window.alert(` ${} costs ${} `)
                }
            }
        }
    }
)
