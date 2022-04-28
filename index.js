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

app.use(express.static(__dirname + "/views"))

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


app.get('/', (req, res) => {
    
    console.log('Accept: ' + req.get('Accept'))
    
    pool.query('SELECT VERSION()', (err, version_results) => {
	console.log(err, version_results)
	
//	pool.query('SELECT * FROM team_members', (err, team_members_results) => {
//	    console.log(err, team_members_results)

pool.query('SELECT * FROM crud_library', (err, crud_library_results) => {            
	            console.log(err, crud_library_results)
													    

	    res.render('index', {
		teamNumber: 1,
	//	databaseVersion: version_results.rows[0].version,
		teamMembers: crud_library_results
	    })
	    
	    
	    console.log('Content-Type: ' + res.get('Content-Type'))
	})
    })
    res.render('index.jade', { title: 'home page' });
});

app.get('/register', function(req, res){
    console.log('Accept: ' + req.get('Accept'))
    
   // pool.query('SELECT VERSION()', (err, version_results) => {
//	console.log(err, version_results.rows)
	
	pool.query('SELECT * FROM user_l', (err, user_l_results) => {
	    console.log(err, user_l_results)
													    
	    res.render('register'
	//	teamNumber: 1,
	//	databaseVersion: version_results.rows[0].version,
	//	user_l: user_l_results.rows
	    )
	    console.log('Content-Type: ' + res.get('Content-Type'))
	})
  //  })

  res.render('register.jade', { title: 'Sign up here' });
  
});

app.get('/login', function(req, res){
    res.render('login.jade', { title: 'login  here' });
  });

app.get('/booktable', function(req, res){
	console.log('Accept: ' + req.get('Accept'))
	
	pool.query('SELECT * FROM crud_library', (err, crud_library_results) => {
	    console.log(err, crud_library_results)

	    res.render('booktable', {
		teamNumber: 1,
		//databaseVersion: version_results.rows[0].version,
		teamMembers: crud_library_results.rows
	    })
	    console.log('Content-Type: ' + res.get('Content-Type'))
	
})
	res.render('booktable.jade', { title: 'Book details' });
  });

app.post('/', (req, res) => {

    pool.query(`INSERT INTO team_members (first_name, last_name) VALUES ('${req.body.first_name}', '${req.body.last_name}')`, (err, result) => {

	console.log(err, result)
	
	res.redirect('/')
    })
})

app.post('/register', (req, res) => {

    pool.query(`INSERT INTO user_l (username, password) VALUES ('${req.body.username}', '${req.body.password}')`, (err, results) => {

    console.log(err, results)
    
    res.redirect('/')
    })
})

app.post('/bookTable', (req, res) => {

	  pool.query(`INSERT INTO team_members (first_name, last_name) VALUES ('${req.body.first_name}', '${req.body.last_name}')`, (err, results) => {
  
	  console.log(err, results)
	  
	  res.redirect('/')
	  })
  })
  

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
