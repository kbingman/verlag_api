require 'mongoid'

class FileBlock
  include Mongoid::Document
  
  field :caption, type: String
  field :path, type: String

end