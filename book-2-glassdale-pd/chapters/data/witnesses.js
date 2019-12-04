const casual = require('casual')

module.exports = () => {

    const statements = ["Was wearing a car dealership hat", "Used the word 'quickly' too much", "Breath smelled like fish", "Think he drove a large pickup truck", "Mentioned he had a pet", "Wasn't very tall", "He wore old, red shoes"]

    const witnesses = () => {
        const random = parseInt(Math.random() * 5) + 1
        const witnesses = []
        for (let i = 0; i < 9; i++) {
            witnesses.push({
                id: i+1,
                name: casual.full_name,
                statements: casual.random_element(statements)
            })
        }
        return witnesses
    }

    function randomDate(start, end) {
        return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
    }





    return { witnesses: witnesses() }

}
