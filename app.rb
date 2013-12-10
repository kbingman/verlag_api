require 'multi_json'

require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/mustache'
require 'sinatra/namespace'

require 'rack/mobile-detect'
require 'rack/cache'
require 'dalli'

# Models
require './models/site'
require './models/page'
require './models/image'

# Presenters
require './presenters/page_presenter'
require './presenters/image_presenter'
 
class App < Sinatra::Base
  
  set :protection, :origin_whitelist => ['http://192.168.0.11:5000', 'http://localhost:9000']

  configure do
    Mongoid.load!('./config/mongoid.yml')
    Mongoid.raise_not_found_error = false
    
    use Rack::MethodOverride
    use Rack::Cache,
      metastore: Dalli::Client.new,
      entitystore: 'file:tmp/rack/body',
      allow_reload: false,
      verbose: true
   
    enable :logging
    enable :cross_origin
    # set :environment, :production
    set :public_folder, 'public' 
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
    
    set :public_folder, 'public'
  end
  
  helpers Sinatra::JSON
  
  helpers do
    def get_klass slug
      slug.capitalize.singularize.constantize
    end
  end
  
  before do
    puts params.inspect if settings.development?
    puts request.env['HTTP_USER_AGENT'] if settings.development?
  end
  
end

# Routes
require './routes/app'
require './routes/api/public'
require './routes/api/resource'
