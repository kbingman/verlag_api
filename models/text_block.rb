require './models/block'

class TextBlock < Block
  
  field :body, type: String
  field :filter, type: String

end