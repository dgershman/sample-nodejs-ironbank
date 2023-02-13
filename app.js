const express = require('express')
const app = express()
const port = 3000
const { Client } = require('pg')

app.get('/ping', (req, res) => {
    res.send('pong')
})

app.get('/', async (req, res) => {
    const client = new Client({
        host: process.env.POSTGRES_HOSTNAME,
        database: process.env.POSTGRES_DB,
        user: process.env.POSTGRES_USER,
        password: process.env.POSTGRES_PASSWORD,
        port: 5432,
    })
    await client
        .connect()
        .then(() => console.log('client has connected'))
        .catch((err) => console.error('error during connection', err.stack))
    const queryres = await client.query('SELECT $1::text as message', ['Hello world from Postgres!'])
    await client
        .end()
        .then(() => console.log('client has disconnected'))
        .catch((err) => console.error('error during disconnection', err.stack))
    res.send(queryres.rows[0].message)
})

app.listen(port, async () => {
    console.log(`Example app listening on port ${port}`)
})
