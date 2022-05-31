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

    //Test #2 - Render HTML for the register path
    it('should render html for the register path', function (done) {

        request(server)
            .get('/register')
            .expect('Content-Type',/html/)
            .expect(200, function(err,res) {

                if (err) {return done (err);}

                done();
            });
    });

    //Test #3 - Not Respond to PUT requests for the root path
    it('should not respond to PUT requests for the root path',
        
        function(done) {

            request(server)
                .put('/')
                .expect(404, function(err, res) {
                    if (err) { return done(err); }

                    done();
                });
        });

    //Test #4 - Responding to nonexistent POST requests for the root path with any error
    it('should respond to nonexistent POST requests for the root path, with any error',
        
        function(done) {

            request(server)
                .post('/')
                .expect(404)
                .end(done);
        });

    after(function(done) {
        app.close(function() {
            done();
        });
    })
});