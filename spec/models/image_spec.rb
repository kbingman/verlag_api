require 'spec_helper'

describe 'Images' do
  
  before(:all) do
    @image = FactoryGirl.create(:image)
  end

  it 'should return a filename' do
    @image.file.filename.should == '830px-Tieboardingcraft.jpg'
  end
  
  it 'should return a path' do
    @image.file.url.should == "/assets/image/#{@image._id}/830px-Tieboardingcraft.jpg"
  end
  
  it 'should return a contenttype' do
    @image.file.content_type.should == 'image/jpeg'
  end

end