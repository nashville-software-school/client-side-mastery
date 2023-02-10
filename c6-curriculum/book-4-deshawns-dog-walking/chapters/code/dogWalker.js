document.addEventListener(
    "click",
    (clickEvent) => {
        const itemClicked = clickEvent.target
        if (itemClicked.id.startsWith("pet")) {
            const [,petId] = itemClicked.id.split("--")

            for (const pet of pets) {
                if (pet.id === parseInt(petId)) {

                    let assignedWalker = {name: ""};

                    for (const walker of walkers) {
                        if () {

                        }
                    }
                    window.alert(`${pet.name} is being walked by ${assignedWalker.name}`)
                }
            }
        }
    }
)
