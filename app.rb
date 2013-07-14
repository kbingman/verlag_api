require 'multi_json'

require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/mustache'
require 'sinatra/namespace'

require 'rack/cache'
require 'dalli'

# Models
require './models/page'
require './models/image'

# Presenters
require './presenters/page_presenter'
require './presenters/image_presenter'
 
class App < Sinatra::Base
  
  set :protection, :origin_whitelist => ['http://localhost:9000']

  configure do
    Mongoid.load!('./config/mongoid.yml')
    use Rack::MethodOverride
    use Rack::Cache,
      metastore: Dalli::Client.new,
      entitystore: 'file:tmp/rack/body',
      allow_reload: false,
      verbose: true
   
    enable :logging
    enable :cross_origin
    # set :environment, :production
    set :public_folder, 'dist' 
  end
  
  CarrierWave.configure do |config|
    config.grid_fs_access_url = '/assets'
    config.root = 'tmp'
    config.cache_dir = 'uploads'
  end
  
  # Dev Environment
  configure :development do
    # require 'rack-livereload'
    require 'sinatra/reloader'
    
    register Sinatra::Reloader
    # use Rack::LiveReload
    
    set :public_folder, 'app'
  end
  
  helpers Sinatra::JSON
  
  helpers do
    def get_klass slug
      slug.capitalize.singularize.constantize
    end
  end
  
  before do
    # puts params.inspect
  end
  
end

# Routes
require './routes/app'
require './routes/api/public'
require './routes/api/resource'
