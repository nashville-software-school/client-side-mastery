
const employeeOrders = (id) => {
    const fulfilledOrders = 0

    for (const order of orders) {
        if (order.employeeId === id) {
            // Increment the number of fulfilled orders
        }
    }

    // Return how many orders were fulfilled
}

document.addEventListener(
    "click",
    (clickEvent) => {
        const itemClicked = clickEvent.target
        if (itemClicked.dataset.type === "employee") {
            const employeeId = itemClicked.dataset.id

            for (const employee of employees) {
                if ( === parseInt(employeeId)) {

                    const orderCount = employeeOrders()

                    window.alert(` ${employee.name} sold ${} products `)
                }
            }
        }
    }
)
