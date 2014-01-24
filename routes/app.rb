class App

  get '/' do
    # puts request.inspect # env['HTTP_USER_AGENT'].match(/(iPad|iPhone)/)
    mustache :index, locals: { content: 'content' }
  end

  get '/articles/*' do
    mustache :index
  end

  get '/images/?*' do
    mustache :index
  end

end