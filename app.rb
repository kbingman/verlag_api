require 'multi_json'

require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/mustache'
require 'sinatra/namespace'

require 'mongoid'
require './models/page'
 


class App < Sinatra::Base
  helpers Sinatra::JSON
  
  helpers do
    def get_klass slug
      slug.capitalize.singularize.constantize
    end
  end

  configure do
    Mongoid.load!('./config/mongoid.yml')
   
    enable :logging
    # set :environment, :production
    set :public_folder, 'dist' 
  end
  
  # Dev Environment
  configure :development do
    require 'rack-livereload'
    require 'sinatra/reloader'
    
    register Sinatra::Reloader
    use Rack::LiveReload
    
    set :public_folder, 'app'
  end

  get '/' do
    mustache :index, locals: { content: 'content' }
  end
  
  # API
  # Namespace this, make helpers local, too
  
  post '/api/:klass' do
    klass = get_klass params[:klass]
    collection = klass.all
    json collection
  end
  
  get '/api/:klass' do
    klass = get_klass params[:klass]
    collection = klass.all
    json collection
  end
  
  get '/api/:klass/:slug?' do
    slug = params[:slug] || '/'
    klass = get_klass params[:klass]
    model = klass.where(slug: slug).first
    json model
  end
end