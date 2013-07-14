require 'mongoid'
require './uploaders/image_uploader'

class Image 
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :file, :file_cache, :page_id
  
  has_and_belongs_to_many :pages, inverse_of: :images
  
  field :caption, type: String
  
  mount_uploader :file, ImageUploader
  
  # before_create :add_page
  # def add_page
  #   self.pages << Page.find(self.page_id)
  # end

end