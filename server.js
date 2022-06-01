// Order matters ! 
const express = require('express')
// const session = require('express-session')
const app = express()
const bodyParser = require('body-parser');

const cookieParser = require('cookie-parser');

const port = process.env.PORT || 3000

const path = require('path');

// Set the view engine for the express app
app.set("view engine", "pug")

// for parsing application/json
app.use(bodyParser.json());
app.use(cookieParser());

// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));
// form-urlencoded

app.use(express.static(__dirname + "/public"))
/*
app.use(session({
	genid: function(req) {
	  return genuuid() // use UUIDs for session IDs
	},
	secret: 'keyboard cat'
  }))
*/
  
// Database
const Pool = require('pg').Pool

var connectionParams = null;

/* istanbul ignore if	*/
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

// Home Page - Get
app.get('/', (req, res) => {
    
    console.log('Accept: ' + req.get('Accept'))

    res.render('index.pug', { title: 'home page' });
});

// Register Page - POST
app.post('/register', (req, res) => {

    pool.query(`INSERT INTO crud_user (fullname, username, password, repassword, userrole) VALUES ('${req.body.fullname}', '${req.body.username}', '${req.body.password}', '${req.body.repassword}', 'patron')`, (err, results) => {

    //console.log(err, results)

    res.redirect('/')
    })
})

// Register Page - GET
app.get('/register', function(req, res){
    //console.log('Accept: ' + req.get('Accept'))
    	
	pool.query('SELECT * FROM crud_user', (err, crud_user_results) => {
	    //console.log(err, crud_user_results)
													    
	    res.render('register')

	    //.log('Content-Type: ' + res.get('Content-Type'))
	})

});

// Login Patron Page - GET
app.get('/login_patron', function(req, res){

    res.render('login_patron.pug', { title: 'Login Here' });
	/*
	if (!req.session.loggedin){

		// in case they are not logged in
		res.send('Please login to view this page!');
	}
	*/
	res.end();
});

// Login Patron Page - POST
app.post('/login_patron', function(req, res) {

	//grabbing the input from the fields
	let username = req.body.username;
	let password = req.body.password;

	console.log(req.body)

	//moves foward if the fields are not empty
	if (username && password) {
		//makes a SQL query that retrieves username and password from DB
		pool.query(`SELECT * FROM crud_user WHERE username = '${username}' AND password = '${password}' AND userrole = 'patron'`, function(error, results, fields) {
			//now that we retrieved the accounts from the crud_user table
			console.log(results)
			//prints the error if there is one
			if (error) throw error;

			//if the account exists
			if (results.rowCount > 0) {
				//this throws a boolean flag that makes a loggedin session true or not which shows whether
				//someone is allowed to view something.
				// req.session.loggedin = true;
				// req.session.username = username;
				// redirects to the book table
				res.cookie('user_id',results.rows[0].id)
				res.redirect('/user_logged_in_homepage');
			} else {
				// res.send('Incorrect Credentials.');
				res.render('login_patron.pug', { title: 'login  here', error: 'Incorrect Credentials.'});
			}			
			res.end();
		});
	} else {
		res.send('Please enter a Username and Password!');
		res.end();
	}
}); 

// Beginning commented lines of the authentication that uses the crud_user(userrole = admin) table
// Login Page - GET
app.get('/login', function(req, res){

    res.render('login.pug', { title: 'login  here' });
	/*
	if (!req.session.loggedin){ 

		// in case they are not logged in
		res.send('Please login to view this page!');
	}
	*/
	res.end();
});

// Login Page - POST
app.post('/login', function(req, res) {
	
	//grabbing the input from the fields
	let username = req.body.username;
	let password = req.body.password;
	console.log(req.body)

	//moves foward if the fields are not empty
	if (username && password) {
		//makes a SQL query that retrieves username and password from DB
		pool.query(`SELECT * FROM crud_user WHERE username = '${username}' AND password = '${password}' AND userrole = 'librarian'`, function(error, results, fields) {
			//now that we retrieved the accounts from the crud_user table
			console.log(results)
			//prints the error if there is one
			if (error) throw error;

			//if the account exists
			if (results.rowCount > 0) {
				//this throws a boolean flag that makes a loggedin session true or not which shows whether
				//someone is allowed to view something.
				// req.session.loggedin = true;
				// req.session.username = username;
				// redirects to the book table
				//console.log("Helloooooooooooooooooooo")
				res.redirect('/logged_in_homepage');
			} else {
				// res.send('Incorrect Credentials.');
				res.render('login.pug', { title: 'login  here', error: 'Incorrect Credentials.'});
			}			
			res.end();
		});
	} else {
		res.send('Please enter a Username and Password!');
		res.end();
	}
}); 

app.get('/logged_in_homepage', function(req, res){

    res.render('logged_in_homepage.pug', { title: 'login  here' });
	/*
	if (!req.session.loggedin){

		// in case they are not logged in
		res.send('Please login to view this page!');
	}
	*/
	res.end();
});

app.get('/user_logged_in_homepage', function(req, res){

    res.render('user_logged_in_homepage.pug', { title: 'login  here' });
	/*
	if (!req.session.loggedin){

		// in case they are not logged in
		res.send('Please login to view this page!');
	}
	*/
	res.end();
});

// crud_reservations
/*
// Book Reservations Page - Read
app.get('/rented_books', function(req, res){
	console.log('Accept: ' + req.get('Accept'))
	
	pool.query(`SELECT * FROM crud_reservations r INNER JOIN crud_library l ON r.book_id = l.id INNER JOIN crud_user u ON r.user_id = u.id`, (err, crud_reservations_results) => {
	    console.log(err, crud_reservations_results)

	    res.render('rented_books', {
		
		crudRentedBooks: crud_reservations_results.rows
	    })
	    console.log('Content-Type: ' + res.get('Content-Type'))
	
	})
});
*/
// Usertable Page - Read
app.get('/rented_books', function(req, res){
	var searchTerm2 = req.query.searchTerm2;
	var searchParam2 = req.query.search_param2;
	var query = `SELECT * FROM crud_reservations r INNER JOIN crud_library l ON r.book_id = l.id INNER JOIN crud_user u ON r.user_id = u.id`;

	if (searchTerm2 != undefined && searchParam2 != undefined) {
		query = `SELECT * FROM crud_reservations r INNER JOIN crud_library l ON r.book_id = l.id INNER JOIN crud_user u ON r.user_id = u.id WHERE ${searchParam2} LIKE '%${searchTerm2}%' ORDER BY ${searchParam2}`;
	}
	if (searchTerm2 == '')
	{
		query = `SELECT * FROM crud_reservations r INNER JOIN crud_library l ON r.book_id = l.id INNER JOIN crud_user u ON r.user_id = u.id ORDER BY ${searchParam2}`;
	}

	pool.query(query, (err, crud_reservations_results) => {
		console.log(err, crud_reservations_results)

		res.render('rented_books', {

		crudRentedBooks: crud_reservations_results.rows
		})
		console.log('Content-Type: ' + res.get('Content-Type'))
	})
});

// Book Reservations Page - Create
app.post('/rented_books/:id', (req, res) => {

	console.log(req.cookies)
	const bookid = req.params["id"]
	const userid = req.cookies['user_id']

	console.log(bookid)
	console.log(userid)
	
	pool.query(`INSERT INTO crud_reservations (book_id, user_id) VALUES (${bookid}, ${userid})`, (err, result) => {
	  console.log(err)
	  
	  res.redirect('/rented_books')
	})
})


// Book Reservations Page - Delete
app.delete('/rented_books/:id/delete', (req, res) => {

	const id = req.params["id"]
  
	console.log(id)
  
	pool.query(`DELETE FROM crud_reservations WHERE id = ${id}`, (err, result) => {
	  console.log(err)
	  
	  res.redirect('/rented_books')
	})
})

// crud_user
// Usertable Page - Read
app.get('/usertable', function(req, res){
	var searchTerm2 = req.query.searchTerm2;
	var searchParam2 = req.query.search_param2;
	var query = `SELECT * FROM crud_user`;

	if (searchTerm2 != undefined && searchParam2 != undefined) {
		query = `SELECT * FROM crud_user WHERE ${searchParam2} LIKE '%${searchTerm2}%' ORDER BY ${searchParam2}`;
	}
	if (searchTerm2 == '')
	{
		query = `SELECT * FROM crud_user ORDER BY ${searchParam2}`;
	}

	pool.query(query, (err, crud_user_results) => {
		console.log(err, crud_user_results)

		res.render('usertable', {

		crudUserMembers: crud_user_results.rows
		})
		console.log('Content-Type: ' + res.get('Content-Type'))
	})
});

// Usertable Page - Update
app.get('/usertable/:id', (req, res) => {

	pool.query(`SELECT * FROM crud_user WHERE id = '${req.params.id}'`, (err, crud_user_results) => {
	    console.log(err, crud_user_results)

	    
	    console.log('Content-Type: ' + res.get('Content-Type'))
		res.render('user_form',{user:crud_user_results.rows[0]})
	})
})

app.post('/usertable/:id', (req, res) => {
	console.log(req.body)
	pool.query(`UPDATE crud_user SET fullname='${req.body.fullname}', username='${req.body.username}', password='${req.body.password}' WHERE id = '${req.params["id"]}'`, (err, results) => { 
	
	console.log(err, results)
	
	res.redirect('/usertable')
	})
})

// Usertable Page - Delete
app.delete('/usertable/:id', (req, res) => {

	const id = req.params["id"]
  
	console.log(id)
  
	pool.query(`DELETE FROM crud_user WHERE id = ${id}`, (err, result) => {
	  console.log(err)
	  
	  res.redirect('/usertable')
	})
})

// crud_library
// Booktable Page - Patron
app.get('/booktable_patron', function(req, res){
	var searchTerm = req.query.searchTerm;
	var searchParam = req.query.search_param;
	var query = `SELECT * FROM crud_library`;

	if (searchTerm != undefined && searchParam != undefined) {
		query = `SELECT * FROM crud_library WHERE ${searchParam} LIKE '%${searchTerm}%' ORDER BY ${searchParam}`;
	}
	if (searchTerm == '')
	{
		query = `SELECT * FROM crud_library ORDER BY ${searchParam}`;
	}

	pool.query(query, (err, crud_library_results) => {
		console.log(err, crud_library_results)

		res.render('booktable_patron', {

		crudLibraryMembers: crud_library_results.rows
		})
		console.log('Content-Type: ' + res.get('Content-Type'))
	})
});

// Booktable Page - Create FIX THIS
app.post('/booktable_patron', (req, res) => {
	pool.query(`INSERT INTO crud_library (book_title, author_name, genre, isbn, books_available) VALUES ('${req.body.book_title}', '${req.body.author_name}', '${req.body.genre}', '${req.body.isbn}', '${req.body.books_available}')`, (err, results) => {

		console.log(err, results)
	
		res.redirect('/booktable_patron')
	})
})

// Booktable Page - Create
app.post('/booktable', (req, res) => {
	pool.query(`INSERT INTO crud_library (book_title, author_name, genre, isbn, books_available) VALUES ('${req.body.book_title}', '${req.body.author_name}', '${req.body.genre}', '${req.body.isbn}', '${req.body.books_available}')`, (err, results) => {

		console.log(err, results)
	
		res.redirect('/booktable')
	})
})

// Booktable Page - Read
app.get('/booktable', function(req, res){
	var searchTerm = req.query.searchTerm;
	var searchParam = req.query.search_param;
	var query = `SELECT * FROM crud_library`;

	if (searchTerm != undefined && searchParam != undefined) {
		query = `SELECT * FROM crud_library WHERE ${searchParam} LIKE '%${searchTerm}%' ORDER BY ${searchParam}`;
	}
	if (searchTerm == '')
	{
		query = `SELECT * FROM crud_library ORDER BY ${searchParam}`;
	}

	pool.query(query, (err, crud_library_results) => {
		console.log(err, crud_library_results)

		res.render('booktable', {

		crudLibraryMembers: crud_library_results.rows
		})
		console.log('Content-Type: ' + res.get('Content-Type'))
	})
});

// Booktable Page - Update
app.get('/booktable/:id', (req, res) => {

	pool.query(`SELECT * FROM crud_library WHERE id = '${req.params.id}'`, (err, crud_library_results) => {
	    console.log(err, crud_library_results)

	    
	    console.log('Content-Type: ' + res.get('Content-Type'))
		res.render('book_form',{book:crud_library_results.rows[0]})
	})
})

app.post('/booktable/:id', (req, res) => {
	console.log(req.body)
	pool.query(`UPDATE crud_library SET book_title='${req.body.book_title}', author_name='${req.body.author_name}', genre='${req.body.genre}', isbn='${req.body.isbn}', books_available='${req.body.books_available}' WHERE id = '${req.params["id"]}'`, (err, results) => { 
	
	console.log(err, results)
	
	res.redirect('/booktable')
	})
})

// Booktable Page - Delete
app.delete('/booktable/:id', (req, res) => {

	const id = req.params["id"]
  
	console.log(id)
  
	pool.query(`DELETE FROM crud_library WHERE id = ${id}`, (err, result) => {
	  console.log(err)
	  
	  res.redirect('/booktable')
	})
})

// app.listen(port, () => {
//     console.log(`Example app listening on port ${port}`)
// })

module.exports = app;
