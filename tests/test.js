

//user.js tests


const chai = require('chai');
const chaiHTTP = require('chai-http');

const app = require('../app');

let should = chai.should();
chai.use(chaiHTTP);

describe('Test of /healthz GET API', () => {
    it('health should be OK', (done) => {
        chai.request(app)
            .get('/healthz')
            .end((err, res) => {
                res.should.have.status(200);
                done();
            });
    });
});

var assert = require('assert');
describe('Array', function () {
  describe('#indexOf()', function () {
    it('should return -1 when the value is not present', function () {
      assert.equal([1, 2, 3].indexOf(4), -1);
    });
  });
});

//product tests

describe('Authentication Test for Get', function() {
  describe('Successes', function() {
      it('Return the product for Get if the id does not exist', function(done) {
          chai.request(app).get('/v1/product/1').send({}).end(function(err, res) {
              chai.expect(res.statusCode).to.be.equal(400);
              done();
          });
      });
    });
})




