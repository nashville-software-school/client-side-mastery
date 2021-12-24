
const employeeOrders = (employee) => {
    const fulfilledOrders = 0

    for (const order of orders) {
        if (order.employeeId === employee.id) {
            // Increment the number of fulfilled orders
        }
    }

    // Return how many orders were fulfilled
}

document.addEventListener(
    "click",
    (clickEvent) => {
        const itemClicked = clickEvent.target
        if (itemClicked.id.startsWith("employee")) {
            const [, employeeId] = itemClicked.id.split("--")

            for (const employee of employees) {
                if ( === parseInt(employeeId)) {

                    const orderCount = employeeOrders()

                    window.alert(` ${employee.name} sold ${} products `)
                }
            }
        }
    }
)
