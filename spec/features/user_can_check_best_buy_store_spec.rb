require "rails_helper"

context "a user can visit /" do
  describe "it can search a zipcode" do
    it " returns a list of stores in the area" do


      visit "/"
      fill_in "q", :with => '80202'
      click_button "Search"
      expect(page).to have_content(16)
      expect(page).to have_content("BigBox")
      expect(page).to have_content("Aurora")
    end

    it "can click on a store name to see store hours" do

      visit "/"
      fill_in "q", :with => '80202'
      click_button "Search"
      expect(page).to have_content(16)

      click_link "Belmar"
    end
  end
end
