require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the page for the individual artist" do
    # As a user
    # Given that an artist exists in the database
    marley_image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    marley = Artist.create(name: "Bob Marley", image_path: marley_image)
    # When I visit that artist's show page
    visit artist_path(marley)
    # And I click on "Edit"
    click_on "Edit"
    # And I fill in a new name
    fill_in "artist_name", with: "Bobby Marley"
    # And I click on "Update Artist"
    click_on "Update Artist"
    # Then I should see the artist's updated name
    expect(page).to have_content "Bobby Marley"
    # Then I should see the existing image
    expect(page).to have_css("img[src=\"#{marley.image_path}\"]")
  end
end
