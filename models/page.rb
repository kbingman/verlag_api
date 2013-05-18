require 'mongoid'

class Page
  include Mongoid::Document
  
  field :title, type: String
  field :slug, type: String
  
end