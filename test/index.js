const server = require('../server');
const request = require('supertest');
const expect = require('chai').expect;

describe('The express server', function () {

    var app;

    before(function(done) {

            app = server.listen(3000, function (err) {
                if(err) { return done(err);}
                done();
            });
    }); 

    //Test #1 - Render HTML for the root path
    it('should render html for the root path', function (done) {

        request(server)
            .get('/')
            .expect('Content-Type',/html/)
            .expect(200, function(err,res) {
                //console.log(res.status);
                if (err) {return done (err);}

                done();
            });
    });

    //Test #2 - Render HTML for the register GET path
    it('should render html for the register GET path', function (done) {

        request(server)
            .get('/register')
            .expect('Content-Type',/html/)
            .expect(200, function(err,res) {

                if (err) {return done (err);}

                done();
            });
    });

     //Test #3 - Render Plain Text for the register POST path
     it('should render plain text for the register POST path', function (done) {

        request(server)
            .post('/register')
            .expect('Content-Type',"text/plain; charset=utf-8")
            .expect(302, function(err,res) {

                if (err) {return done (err);}

                done();
            });
    });

    //Test #4 - Not Respond to PUT requests for the root path
    it('should not respond to PUT requests for the root path',
        
        function(done) {

            request(server)
                .put('/')
                .expect(404, function(err, res) {
                    if (err) { return done(err); }

                    done();
                });
        });

    //Test #5 - Responding to nonexistent POST requests for the root path with any error
    it('should respond to nonexistent POST requests for the root path, with any error',
        
        function(done) {

            request(server)
                .post('/')
                .expect(404)
                .end(done);
        });

    //Test #6 - Render HTML for the login_patron GET path
    it('should render html for the login_patron GET path', function (done) {

        request(server)
            .get('/login_patron')
            .expect('Content-Type',/html/)
            .expect(200, function(err,res) {
    
                if (err) {return done (err);}
    
                done();
            });
    });

    after(function(done) {
        app.close(function() {
            done();
        });
    })
});