class App
  
  get '/' do
    mustache :index, locals: { content: 'content' }
  end
  
  get '/pages/*' do
    mustache :index
  end
  
end