FactoryGirl.define do
  factory :item do
    titre Faker::Lorem.word
    contenu Faker::Lorem.paragraph
    image Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/spongebob.jpg'), 'image/jpeg')
    user # association
    # image { fixture_file_upload( 'spec/fixtures/spongebob.jpg', 'image/jpg') }
  end

  # factory :item_db, class: Item do
    # titre Faker::Lorem.word
    # contenu  Faker::Lorem.paragraph
    # image Rails.root.join("/items/spongebob.jpg")
    # FileUtils.cp "spec/fixtures/spongebob.jpg", "public/items/spongebob.jpg"
  # end
end
