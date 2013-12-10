FactoryGirl.define do
  sequence(:email) {|n| "person-#{n}@example.com" }
  sequence(:count)
  
  factory :site do 
    sequence(:name) {|n| "Site #{n}" }
    sequence(:domain) {|n| "domain#{n}.com" }
    
    factory :site_with_pages do
      ignore do
        pages_count 3
      end
    
      after(:create) do |site, evaluator|
        FactoryGirl.create_list(:page, evaluator.pages_count, site: site)
      end
    end
    
    
    factory :site_with_images do
      ignore do
        images_count 3
      end
    
      after(:create) do |site, evaluator|
        FactoryGirl.create_list(:image, evaluator.images_count, site: site)
      end
    end
  end

  factory :page do
    sequence(:title) {|n| "Title #{n}" }
    sequence(:slug) {|n| "slug-#{n}" } 

    factory :page_with_blocks do
      ignore do
        text_blocks_count 3
      end
    
      after(:create) do |page, evaluator|
        FactoryGirl.create_list(:text_block, evaluator.text_blocks_count, page: page)
      end
    end
    
    factory :page_with_image_blocks do
      ignore do
        blocks_count 1
      end
    
      after(:create) do |page, evaluator|
        FactoryGirl.create_list(:image_block, evaluator.blocks_count, page: page)
      end
    end
  end
  
  factory :text_block do 
    sequence(:name) {|n| "Name #{n}" }
    sequence(:position) {|n| n }
    
    body { Forgery::LoremIpsum.paragraphs(3) }
  end
  
  factory :image do 
    sequence(:caption) {|n| "Caption #{n}" }
    file File.open('./spec/data/830px-Tieboardingcraft.jpg')
  end
  
  factory :image_block do 
    sequence(:name) {|n| "Name #{n}" }
    # image FactoryGirl.create(:image)
  end
  

  
end