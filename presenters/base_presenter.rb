class BasePresenter
  
  def initialize model
    @model = model 
  end
  
  def model
    @model
  end
  
  def method_missing meth
    if @model.respond_to? meth
      @model.send meth
    else
      super
    end
  end
  
  # Override this to customize each presenter
  def as_json
    @model.as_json
  end
  
end
