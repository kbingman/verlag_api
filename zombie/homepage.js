var chai = require('chai'),
    browser = require('zombie');
    
chai.should();

describe('Initialization', function(){
  
  it('should load the home page', function(done){

    browser.visit('http://127.0.0.1:5000', function(error, browser, status){
      if (error){
        console.log(error)
      }
      browser.success.should.equal(true);
      done();
    });
    
  });
  
  it('should have the correct title', function(done){

    browser.visit('http://127.0.0.1:5000', function(error, browser, status){
      if (error){
        console.log(error)
      }
      browser.text('title').should.equal('verlag');
      done();
    });
    
  });
  
  it('should have the Pages header', function(done){

    browser.visit('http://127.0.0.1:5000', function(error, browser, status){
      if (error){
        console.log(error)
      }
      browser.text('h4').should.equal('Pages');
      done();
    });
    
  });


  it('should load the home page', function(done){

    browser.visit('http://127.0.0.1:5000', function(error, browser, status){
      if (error){
        console.log(error)
      }
      browser.html('h4').should.equal('<h4>Pages</h4>');
      done();
    });
    
  });

});
