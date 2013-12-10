require 'spec_helper'

describe 'Site' do
  
  context 'Validations' do
    # before(:all) do
    #   @page = FactoryGirl.create(:page)
    # end
    
    it 'should create a valid site' do
      site = FactoryGirl.build(:site, domain: 'domain.com', name: 'name')
      site.valid?.should be_true
    end
    
    it 'should require a domain' do
      site = FactoryGirl.build(:site, domain: nil)
      site.valid?.should be_false
    end
    
    it 'should require a name' do
      site = FactoryGirl.build(:site, name: nil)
      site.valid?.should be_false
    end
    
  end
  
  context 'Site Relations' do
    
    it 'should retren the correct length of pages' do
      @site = FactoryGirl.create(:site_with_pages)
      @site.pages.length.should == 3
    end
    
    it 'should retren the correct length of images' do
      @site = FactoryGirl.create(:site_with_images)
      @site.images.length.should == 3
    end
  
  end
  
end