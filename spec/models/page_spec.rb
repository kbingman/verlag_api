require 'spec_helper'

describe 'Pages' do
  
  # before(:all) do
  #   @page = FactoryGirl.create(:page)
  # end

  it 'should require a title' do
    page = FactoryGirl.build(:page, title: nil)
    page.valid?.should be_false
  end
  
  it 'should create a slug' do
    page = FactoryGirl.build(:page, slug: nil, title: "Test Title")
    page.valid?
    page.slug.should == 'test-title'
  end
  
end

describe 'Image Blocks' do
  before(:all) do
    @page = FactoryGirl.build(:page)
    @image = FactoryGirl.create(:image)
    @image_block = FactoryGirl.create(:image_block, page: @page, image: @image)
    @page.save
  end
  
  it 'should have an image block and image' do
    @image_block.image.should == @image
  end
  
  it 'should reference the page' do
    @page.images.should == [@image]
  end
  
end