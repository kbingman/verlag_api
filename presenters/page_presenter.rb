require './presenters/base_presenter'
require './presenters/block_presenter'
require './presenters/text_block_presenter'
require './presenters/image_block_presenter'
require './presenters/image_presenter'

class PagePresenter < BasePresenter
  
  def initialize model
    @model = model 
  end
  
  def model
    @model
  end
  
  def blocks
    @model.blocks.collect{ |b| 
      "#{b._type}Presenter".constantize.new(b).as_json 
    }
  end
  
  def images
    @model.images.collect{ |i| 
      ImagePresenter.new(i).as_json 
    }
  end
  
  def method_missing meth
    if @model.respond_to? meth
      @model.send meth
    else
      super
    end
  end
  
  def as_json
    {
      _id: @model._id,
      title: @model.title,
      slug: @model.slug,
      created_at: @model.created_at,
      updated_at: @model.updated_at,
      content: content
    }
  end
  
end