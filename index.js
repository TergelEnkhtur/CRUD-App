// Order matters ! 
const express = require('express')
const app = express()
const bodyParser = require('body-parser');
const port = process.env.PORT || 3000

const path = require('path');

// Set the view engine for the express app
app.set("view engine", "jade")

// for parsing application/json
app.use(bodyParser.json());

// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));
// form-urlencoded

app.use(express.static(__dirname + "/public"))

// Database
const Pool = require('pg').Pool

var connectionParams = null;
if (process.env.DATABASE_URL != null) {
    connectionParams = {
	connectionString: process.env.DATABASE_URL,
	ssl: { rejectUnauthorized: false}
    }
} else {
    connectionParams = {
	user: 'api_user',
	host: 'localhost',
	database: 'api',
	password: 'password',
	port: 5432
    }
}
console.log(connectionParams)
const pool = new Pool(connectionParams)

// All Main App Controls

// App Get Controls
app.get('/', (req, res) => {
    
    console.log('Accept: ' + req.get('Accept'))
    
    pool.query('SELECT VERSION()', (err, version_results) => {
	console.log(err, version_results)

pool.query('SELECT * FROM crud_library', (err, crud_library_results) => {            
	            console.log(err, crud_library_results)
													    
	    res.render('index', {
		crudLibraryMembers: crud_library_results
	    })
	    
	    console.log('Content-Type: ' + res.get('Content-Type'))
	})
    })
    res.render('index.jade', { title: 'home page' });
});

// App Get - - Register Page
app.get('/register', function(req, res){
    console.log('Accept: ' + req.get('Accept'))
    	
	pool.query('SELECT * FROM crud_user', (err, crud_user_results) => {
	    console.log(err, crud_user_results)
													    
	    res.render('register'
	//	teamNumber: 1,
	//	databaseVersion: version_results.rows[0].version,
	//	user_l: user_l_results.rows
	    )
	    console.log('Content-Type: ' + res.get('Content-Type'))
	})
  res.render('register.jade', { title: 'Sign up here' });
  
});

// App Get - - Login Page
app.get('/login', function(req, res){

    res.render('login.jade', { title: 'login  here' });
	
});

// App Get - - Booktable Page
app.get('/booktable', function(req, res){
	console.log('Accept: ' + req.get('Accept'))
	
	pool.query('SELECT * FROM crud_library', (err, crud_library_results) => {
	    console.log(err, crud_library_results)

	    res.render('booktable', {
		
		crudLibraryMembers: crud_library_results.rows
	    })
	    console.log('Content-Type: ' + res.get('Content-Type'))
	
})
});

app.post('/', (req, res) => {

    pool.query(`INSERT INTO crud_library (book_title, author_name, genre, isbn, books_available) VALUES ('${req.body.book_title}', '${req.body.author_name}', '${req.body.genre}', '${req.body.isbn}', 'sad')`, (err, result) => {

	console.log(err, result)
	
	res.redirect('/')
    })
})

app.post('/register', (req, res) => {

    pool.query(`INSERT INTO crud_user (username, password, repassword, userrole) VALUES ('${req.body.username}', '${req.body.password}', '${req.body.repassword}', 'admin')`, (err, results) => {

    console.log(err, results)
    
    res.redirect('/')
    })
})

app.post('/bookTable', (req, res) => {

	  pool.query(`INSERT INTO crud_library (book_title, author_name, genre, isbn, books_available) VALUES ('${req.body.book_title}', '${req.body.author_name}', '${req.body.genre}', '${req.body.isbn}', 'sad')`, (err, results) => {
  
	  console.log(err, results)
	  
	  res.redirect('/')
	  })
  })
  

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
