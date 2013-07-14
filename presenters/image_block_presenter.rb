require './presenters/base_presenter'

class ImageBlockPresenter < BasePresenter
  
  def image
    if @model.image
      ImagePresenter.new(@model.image).as_json
    end
  end
  
  # This may need to know the subclass
  def as_json
    {
      _id: @model._id,
      name: @model.name,
      position: @model.position,
      class_name: @model._type,
      created_at: @model.created_at,
      updated_at: @model.updated_at,
      images: [
        self.image
      ]
    }
  end
  
end