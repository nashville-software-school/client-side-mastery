const casual = require('casual');

for (let i = 1; i <= 10; i++) {
    const criminal = {
        id: i,
        age: 22 + (Math.random() * 38),
        eyeColor: casual.random_element(['blue', 'brown', 'green', 'hazel'])
    }

}


const jsonServer = require('json-server')
const server = jsonServer.create()
const router = jsonServer.router('criminals.json')

//const middlewares = jsonServer.defaults({ noCors: true })
const middlewares = jsonServer.defaults()
const port = process.env.PORT || 8085

server.use(middlewares)
server.use(router)

server.listen(port, () => {
    console.log('JSON Server is running')
})

