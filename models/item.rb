require 'mongoid'

class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :slug, type: String
  field :position, type: Integer
  
  validates :title, :presence => true
  validates :slug, :presence => true
  
  has_and_belongs_to_many :images, inverse_of: :pages
  belongs_to :site

end