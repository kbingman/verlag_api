require 'mongoid'
require './models/page'
require './models/image'

class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :domain, type: String
  
  validates :name, :presence => true
  validates :domain, :presence => true
  
  has_many :pages, autosave: true
  has_many :images, autosave: true

end