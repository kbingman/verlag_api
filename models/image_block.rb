require 'mongoid'

class ImageBlock 
  include Mongoid::Document
  
  field :caption, type: String
  field :path, type: String

end