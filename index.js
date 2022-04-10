const express = require('express')
const app = express()
const port = process.env.PORT || 3000

app.get('/', (req, res) => {
    //console.log(req.method)
    console.log('Accept: ' + req.get('Accept'))
    
    res.send('<h1>Hello World!</h1>')

    console.log('Content-Type: ' + res.get('Content-Type'))
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
