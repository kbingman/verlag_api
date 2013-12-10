require 'spec_helper'

describe 'Images' do
  
  before(:each) do
    @image = FactoryGirl.create(:image)
  end
  
  context 'File attributes' do

    it 'should return a filename' do
      @image.file.filename.should == '830px-Tieboardingcraft.jpg'
    end
    
    it 'should return a path' do
      @image.file.url.should == "/assets/image/#{@image._id}/830px-Tieboardingcraft.jpg"
    end
    
    it 'should return a content type' do
      @image.file.content_type.should == 'image/jpeg'
    end

  end
  
  context 'Blocks and Pages' do
    
    before(:each) do
      @page = FactoryGirl.create(:page)
      @block = FactoryGirl.create(:image_block, page: @page)
    end
  
    it 'should add a page to the image' do
      @image.page_id = @page._id
    
      @image.pages.should include(@page)
    end
  
    it 'should add a image_block to the image' do
      @image.page_id = @page._id
      @image.block_id = @block._id
    
      @image.block_ids.should include(@block._id)
    end
  
    it 'should find an image block' do
      @image.page_id = @page._id
      @image.block_id = @block._id
      # @image.save
      
      @image.blocks.should include @block
    end
  
  end

end

