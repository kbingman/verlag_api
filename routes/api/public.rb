class App
  
  # Public API
  # --------------------------------
  # Namespace and Version this, make helpers local, too
  
  get '/api/public/v1/:klass/:slug' do
    cache_control :public, max_age: 60
    headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
    
    slug = params[:slug] || '/'
    klass = get_klass params[:klass]
    model = klass.where(slug: slug).first
    
    presenter = "#{klass}Presenter".constantize.new(model)
    json presenter.as_json
  end
  
end