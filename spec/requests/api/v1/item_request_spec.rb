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
      # expect(page).to have_content(item1.name)
    end
  end
end
