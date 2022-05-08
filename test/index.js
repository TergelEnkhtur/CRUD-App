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
    it('should render html for the root path', function (done) {

        request(server)
            .get('/')
            .expect('Content-Type',/html/)
            .expect(200, function(err,res) {
                if (err) {return done (err);}

                done();
            });
    });


    it('should not respond to Put request for the root path',
    function(done) {
        request(server)
        .put('/')
        .expect(404, function(err, res) {
            if (err) { return done(err); }
            done();
        });
    });

    it('should respond to valid POST requests for the root path, with a redirect',
    function(done) {
        request(server)
        .post('/')
        .send({
            "first_name": "test",
            "last_name": "test"
        })
        .expect(302) 
        .expect('Location', '/')
        .end(done);
        });

        it('check app status', function (done) {
            chai.request(server).get('/').end((err, res) => {
              should.not.exist(err);
              res.should.have.status(200);
              done();
            })
          });

        // it('should respond to invalid POST requests for the root path, with a error',
        // function(done) {
        //     request(server)
        //     .post('/')
        //     .expect(400) 
        //     .end(done);
        //     });   
    

    after(function(done) {
        app.close(function() {
            done();
        });
    })
});