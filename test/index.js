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
                if (err) {return done (err);}

                done();
            });
    });

    //Test #2 - Not Respond to PUT requests for the root path
    it('should not respond to PUT requests for the root path',
        
        function(done) {

            request(server)
                .put('/')
                .expect(404, function(err, res) {
                    if (err) { return done(err); }

                    done();
                });
        });

    after(function(done) {
        app.close(function() {
            done();
        });
    })
});