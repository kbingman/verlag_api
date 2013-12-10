require 'mongoid'
require './uploaders/image_uploader'

class Image 
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :file, :file_cache #, :page_id, :block_id
  
  has_and_belongs_to_many :pages, inverse_of: :images
  belongs_to :site
  
  field :caption, type: String
  field :block_ids, type: Array, default: []
  
  mount_uploader :file, ImageUploader

  def blocks    
    self.pages.collect{ |page| 
      block = page.blocks.find self.block_ids
      
      return block if block
    }
  end
  
  def page_id= page_id
    page = Page.find(page_id)
    self.pages << page
  end
  
  def block_id= block_id
    
    # puts block_id
    # block = page.blocks.find(self.block_id)
    # block.image = self
    # block.save

    self.block_ids << block_id # block._id if block
  end

  # before_create :update_blocks
  # def update_blocks
  #   if self.page_id
  #     page = Page.find(self.page_id)
  #     self.pages << page
  #   end
  # 
  #   if self.block_id
  #     block = page.blocks.find(self.block_id)
  #     block.image = self
  #     block.save
  #   end
  # 
  #   self.block_ids << block._id if block
  # end

end