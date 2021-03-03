const casual = require('casual')

module.exports = () => {

    const alibis = ["shining my shoes", "doing goat yoga", "taking a shower", "fixing my toilet", "playing squash", "cleaning my andirons", "feeding the pigeons", "having a bunion removed", "with my mistress at the motel", "hugging my teddy bear", "thumping melons to find the perfect one", "test driving a car", "cooking dinner", "picking flowers", "painting a portrait", "singing karaoke", "doing the hanky panky", "eating a sandwich", "watching television", "selling a car to a police officer", "working", "sleeping", "reading a book", "writing a book","riding a bike","crashing a scooter","skateboarding","walking my dog","touristing","eating coookies","watching americas next top model","eating a bagel","flying over texas","driving a pinto","filling out paper work","touring the world","trying to find the doctor","listening to rap","listening to heavy metal","creating cups out of styrofoam","jumping out of a plane","eating chips and watching so you think you can dance","getting married","shopping for undergarments","staring at a computer","walking my water buffalo","eating a shoe","shredding paper","eating a table",`defensivly ${casual.random_element(["eating","drinking"])} ${casual.random_element(["donuts","cookies","chips","soda","water","orange juice","bananas","blood","milk","bagels","cheerios","faygo"])}`,"protesting donut making rights","inventing coffee","eating tissues","staring at the carpet","cleaning the chair","hoovering the string department","creating bandanas","watching pink and purple elephants fly","blowing up leaves in my yard","watching blocks rain from the sky","doing homework","making paper baskets","disposing of body bags","mowing the lawn"]

    const work = () => {
        const random = parseInt(Math.random() * 4) + 1
        const companies = []
        for (let i = 0; i < random; i++) {
            companies.push(casual.company_name)
        }
        return companies
    }

    const knownAssociates = () => {
        const random = parseInt(Math.random() * 5) + 1
        const associates = []
        for (let i = 0; i < random; i++) {
            associates.push({name: casual.full_name, alibi: casual.random_element(alibis)})
        }
        return associates
    }

    const officers = () => {
        const cops = []
        for (let i = 0; i < 15; i++) {
            cops.push(casual.full_name)
        }
        return cops
    }

    function randomDate(start, end) {
        return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
    }


    let data = { officers: [
        "Marques Balistreri",
        "Alessia Bailey",
        "Lazaro Leuschke",
        "Braden Stoltenberg",
        "Betty Flatley",
        "Lilian Pfannerstill",
        "Karolann Green",
        "Terrence Parisian",
        "Arne Carroll",
        "Coleman Rau",
        "Marlin Oberbrunner",
        "Katherine Thompson",
        "Margaret Debrowski",
        "Sydnee Howell",
        "Ryleigh West",
        "Gino Hill"
        ],
        criminals: []
    }

    for (let i = 1; i <= 100; i++) {
        const criminal = {
            id: i,
            age: parseInt(22 + (Math.random() * 38)),
            eyeColor: casual.random_element(['blue', 'brown', 'green', 'hazel']),
            name: casual.full_name,
            workHistory: work(),
            phone: casual.phone,
            address: casual.address,
            incarceration: {
                start: randomDate(new Date(1982, 0, 1), new Date(2001, 0, 1)),

                end: randomDate(new Date(2002, 0, 1), new Date(2030, 0, 1))

            },
            conviction: casual.random_element(["arson","murder","grand theft","vandalism","assault","battery","conspiracy to commit murder","tax evasion","theft","assault with a deadly weapon","manslaughter","blackmail","bribery","burglary","forgery","fraud","mail fraud","larceny","kidnapping","false imprisonment","criminal negligence","child abuse","animal abuse"]),
            arrestingOfficer: casual.random_element(data.officers),
            known_associates: knownAssociates(),
        }
        data.criminals.push(criminal)
    }

    return data

}
