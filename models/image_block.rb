require './models/block'

class ImageBlock < Block
  
  field :caption, type: String
  field :image_id, type: Moped::BSON::ObjectId
  
  def image
    Image.find self.image_id if self.image_id
  end
  
  def image= image
    self.image_id = image._id
  end
end