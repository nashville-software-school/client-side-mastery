document.addEventListener(
    "click",
    (clickEvent) => {
        const itemClicked = clickEvent.target

        if (itemClicked.dataset.type === "product") {
            for (const product of products) {
                if (product.id === parseInt()) {
                    window.alert(`${} costs ${} `)
                }
            }
        }
    }
)
