require 'spec_helper'

describe 'Page Presenter' do
  
  before(:all) do
    @page = FactoryGirl.create(:page_with_blocks)
    @presenter = PagePresenter.new @page
  end

  it 'should show the title' do
    @presenter.title.should == @page.title
  end
  
  it 'should show the slug' do
    @presenter.slug.should == @page.slug
  end
  
  it 'should show the blocks as a json hash' do
    block_hashes = @page.blocks.collect{ |block|
      {
        _id: block._id,
        name: block.name,
        body: block.body,
        position: @model.position,
        class_name: block.class.to_s,
        created_at: block.created_at,
        updated_at: block.updated_at
      }
    }
    
    @presenter.blocks.should == block_hashes
  end
  
  it 'should return a json hash' do
    @presenter.as_json.should == {
      _id: @page._id,
      title: @page.title,
      slug: @page.slug,
      created_at: @page.created_at,
      updated_at: @page.updated_at,
      blocks: @presenter.blocks
    }
  end
  
end