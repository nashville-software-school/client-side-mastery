
document.addEventListener(
    "click",
    (clickEvent) => {
        const itemClicked = clickEvent.target
        if (itemClicked.id.startsWith("employee")) {
            const [, employeeId] = itemClicked.id.split("--")

            for (const employee of employees) {
                if ( === parseInt(employeeId)) {

                    const employeeOrders = orders.filter(  // <--- Go to YouTube and search "javascript array filter"
                        (order) => {
                            if (order.employeeId === employee.id) {
                                return true
                            }
                        }
                    )

                    window.alert(` ${employee.name} sold ${} products `)
                }
            }
        }
    }
)
