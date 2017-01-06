require "rails_helper"

describe "items endpoint" do
  context "GET items" do
    it "can return a JSON response of items" do
      item1 = Item.create!(name: "Test", description: "Image", image_url: "String")
      item2 = Item.create!(name: "Test2", description: "Image", image_url: "String2")
      item3 = Item.create!(name: "Test3", description: "Image", image_url: "String3")

      # When I send a GET request to `/api/v1/items`
      get "/api/v1/items"
      # I receive a 200 JSON response containing all items
      expect(response).to be_success
      # And each item has an id, name, description, and image_url but not the created_at or updated_at
      expect(item1.name).to eq("Test")
      expect(item1.description).to eq("Image")
      expect(item1.image_url).to eq("String")
    end
  end

  context "GET item by ID" do
    it "can return a JSON response on an item" do
      item1 = Item.create!(name: "Test", description: "Image", image_url: "String")

      # When I send a GET request to `/api/v1/items/1`
      get "/api/v1/item/#{item1.id}"
      expect(response).to be_success
      # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
      expect(item1.name).to eq("Test")
      expect(item1.description).to eq("Image")
      expect(item1.image_url).to eq("String")
    end
  end

  context "DELETE item by ID" do
    it "can delete an item" do
      item1 = Item.create!(name: "Test", description: "Image", image_url: "String")
      item2 = Item.create!(name: "Test2", description: "Image", image_url: "String2")
      item3 = Item.create!(name: "Test3", description: "Image", image_url: "String3")

      delete "/api/v1/item/#{item1.id}"
      expect(response).to be_success

      # expect(response).to_not have_content(item1.name)
    end
  end

  context "POST an item by ID" do
    it "can create an item" do
      item1 = Item.create!(name: "Test", description: "Image", image_url: "String")

      # When I send a POST request to `/api/v1/items` with a name, description, and image_url

      post '/api/v1/items/', item: {:name => "Test2", :description => "Image2", :image_url => "String2" }
      # I receive a 201 JSON  response if the record is successfully created
      expect(response).to be_success
      # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
      item = Item.find_by(name: "Test2")
      get "api/v1/item/#{item.id}"
      expect(item.name).to eq("Test2")
      expect(item.description).to eq("Image2")
      expect(item.image_url).to eq("String2")
    end
  end
end
