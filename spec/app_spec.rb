require 'spec_helper'

describe 'Sinatra App' do

  it 'should respond to GET' do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/verlag/)
  end

end

describe 'Pages Api' do
  
  before(:all) do
    @page = FactoryGirl.create(:page)
    @expected_json = {
      _id: @page._id,
      title: @page.title,
      slug: @page.slug,
      created_at: @page.created_at,
      updated_at: @page.updated_at,
      blocks: []
    }
  end

  it 'should return the pages api' do
    get '/api/pages'
    last_response.should be_ok
  end
  
  it 'should return the pages api' do
    get '/api/pages'

    last_response.body.should == [@expected_json].to_json
  end
  
  it 'should return the page api' do 
    get "/api/pages/#{@page._id}"

    last_response.body.should == @expected_json.to_json
  end
  
  it 'should update the page' do 
    put "/api/pages/#{@page._id}", page: { title: 'The New Title' }
    
    returned_json = JSON.parse(last_response.body)
    returned_json['title'].should == 'The New Title'
  end
  
end