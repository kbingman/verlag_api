require 'spec_helper'

describe 'Image Block Presenter' do
  
  before(:all) do
    @page = FactoryGirl.create(:page_with_image_blocks)
    @image_block = @page.image_blocks.first
    @image = FactoryGirl.create(:image)
    @image_block.image = @image
    @page.save

    @presenter = ImageBlockPresenter.new @image_block
  end

  it 'should show the name' do
    @presenter.name.should == @image_block.name
  end
  
it 'should show the image as a json hash' do
  @presenter.image[:_id].should == @image._id
end
  
  it 'should return a json hash' do
    @presenter.as_json.should == {
      _id: @image_block._id,
      name: @image_block.name,
      position: @model.position,
      class_name: @image_block._type,
      created_at: @image_block.created_at,
      updated_at: @image_block.updated_at,
      images: [{
        _id: @image._id,
        caption: @image.caption,
        path: @image.file.url,
        filename: @image.file.filename,
        # created_at: @image.created_at,
        # updated_at: @image.updated_at,
        page_ids: [@page._id]
      }]
    }
  
  end
  
end