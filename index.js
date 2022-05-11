const app = require('./server');

const port = process.env.PORT || 3000

const path = require('path');

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
