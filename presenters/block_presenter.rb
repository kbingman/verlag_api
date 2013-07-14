require './presenters/base_presenter'

class BlockPresenter < BasePresenter
  
  # def images
  #   @model.images.collect{ |i| ImagePresenter.new(i).as_json }
  # end
  
  # This may need to know the subclass
  def as_json
    {
      _id: @model._id,
      name: @model.name,
      body: @model.body,
      class_name: @model._type,
      created_at: @model.created_at,
      updated_at: @model.updated_at
    }
  end
  
end