require 'sinatra/base'
require 'sinatra/reloader'
require 'multi_json'
require 'sinatra/json'

require 'rack-livereload'

class App < Sinatra::Base
  helpers Sinatra::JSON

  configure do
    enable :logging
    # set :environment, :production
    set :public_folder, ENV['RACK_ENV'] == 'production' ? 'dist' : 'app'
  end
  
  # Dev Environment
  configure :development do
    register Sinatra::Reloader
    use Rack::LiveReload
  end

  get '/' do
    erb :index, locals: { content: erb(:'_content') }
  end
  
  get '/pages' do
    erb :index, locals: { content: erb(:'_new_page') }
  end
  
  get '/api/pages/:id' do
    json id: params[:id], title: 'title', post: 'post' 
  end
end