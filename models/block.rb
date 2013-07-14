require 'mongoid'

class Block
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embedded_in :page
  
  field :name, type: String
  field :position, type: Integer

end