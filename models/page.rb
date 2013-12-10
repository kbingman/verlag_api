require 'mongoid'
require './models/text_block'
require './models/image_block'

class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :slug, type: String
  field :position, type: Integer
  
  field :content, type: String
  
  validates :title, :presence => true
  validates :slug, :presence => true
  
  embeds_many :blocks
  
  has_and_belongs_to_many :images, inverse_of: :pages
  belongs_to :site
  
  # accepts_nested_attributes_for :blocks
  
  def image_blocks
    self.blocks.where(_type: 'ImageBlock')
  end
  
  def text_blocks
    self.blocks.where(_type: 'TextBlock')
  end
  
  private
    before_validation :create_slug
    def create_slug
      if self.title
        self.slug = self.slug.blank? ? self.title.parameterize : self.slug
      end
    end
    
    before_save :save_images
    def save_images
      self.image_blocks.each do |block|
        self.images << block.image
      end
    end

end