ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rubygems'
require 'bundler'
Bundler.setup :test

require 'rack/test'  
require 'rspec' 

require 'factory_girl' 
require 'forgery' 
require File.join(File.dirname(__FILE__), 'factories.rb') 

RSpec.configure do |config|

  include Rack::Test::Methods
  include RSpec::Expectations
  include RSpec::Matchers

  def app
    App.new
  end

  config.before :all do
    clean_db
  end

  config.after :all do
    clean_db
  end
  
  def clean_db
    Mongoid.default_session.collections.each do |collection|
       unless collection.name =~ /^system\./
         collection.drop
       end
    end
  end

end