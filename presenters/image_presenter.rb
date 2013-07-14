require './presenters/base_presenter'

class ImagePresenter < BasePresenter
  
  def as_json
    {
      _id: @model._id,
      caption: @model.caption,
      path: @model.file.url,
      filename: @model.file.filename,
      # created_at: @model.created_at,
      # updated_at: @model.updated_at,
      page_ids: @model.page_ids
    }
  end
  
end