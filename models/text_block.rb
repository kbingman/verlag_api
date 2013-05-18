require 'mongoid'

class TextBlock
  include Mongoid::Document
  
  field :body, type: String
  field :filter, type: String

end