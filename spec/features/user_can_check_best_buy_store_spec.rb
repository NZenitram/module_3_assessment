require "rails_helper"

context "a user can visit /" do
  describe "it can search a zipcode" do
    it " returns a list of stores in the area" do

      # As a user
      # When I visit "/"
      visit "/"
      # And I fill in a search box with "80202" and click "search"
      fill_in "q", :with => '80203'
      click_button "Search"
      # Then my current path should be "/search" (ignoring params)
      # And I should see stores within 25 miles of 80202
      # And I should see a message that says "16 Total Stores"
      expect(page).to have_content(16)
      # And I should see exactly 15 results
      # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    end
  end
end
