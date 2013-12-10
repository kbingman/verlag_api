class App
  
  get '/' do
    # puts request.inspect # env['HTTP_USER_AGENT'].match(/(iPad|iPhone)/)
    mustache :index, locals: { content: 'content' }
  end
  
  get '/pages/*' do
    mustache :index
  end
  
end