class App
  
  # Private API
  # --------------------------------
  # Namespace this, make helpers local, too
  
  post '/api/:klass' do
    headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
    headers['Access-Control-Allow-Methods'] = 'POST'

    klass = get_klass params[:klass]
    attributes = params[klass.to_s.downcase]
    model = klass.new attributes

    if model.save
      presenter = "#{klass}Presenter".constantize.new(model)
      json presenter.as_json
    else
      status 400
      json model.errors
    end
  end
  
  get '/api/:klass' do
    headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
    
    klass = get_klass params[:klass]
    collection = klass.all
    
    json_collection = collection.collect{ |model| 
      presenter = "#{klass}Presenter".constantize.new(model)
      presenter.as_json
    }
    
    json json_collection
  end
  
  get '/api/:klass/:id' do
    headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
    
    klass = get_klass params[:klass]
    model = klass.find params[:id]
    
    presenter = "#{klass}Presenter".constantize.new model

    json presenter.as_json
  end
    
  put '/api/:klass/:id' do
    headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
    headers['Access-Control-Allow-Methods'] = 'PUT'
    
    klass = get_klass params[:klass]
    model = klass.find params[:id]
    
    if model.update_attributes params[klass.to_s.downcase]
      presenter = "#{klass}Presenter".constantize.new(model)
      json presenter.as_json
    else
      json model.errors
    end
  end
  
  delete '/api/:klass/:id' do
    headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
    headers['Access-Control-Allow-Methods'] = 'DELETE'
     
    klass = get_klass params[:klass]
    model = klass.find params[:id]
    
    model.destroy
    json id: id 
  end
  
  get '/assets/:klass/:id/?:filename?' do
    cache_control :public, max_age: 300
    
    klass = get_klass params[:klass]
    model = klass.find params[:id]
    file = model.file.read
    
    content_type model.file.content_type
    file
  end
  
end
  
  