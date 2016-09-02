require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "the see the page with all remaining artists" do
    # As a user
    # Given that an artist exists in the database
    marley_image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    marley = Artist.create(name: "Bob Marley", image_path: marley_image)
    # When I visit that artist's show page
    visit artist_path(marley)
    # And I click on "Delete"
    click_on "Delete"
    # Then I should be back on the artist index page
    expect(page).to have_content "All Artists"
    # Then I should not see the artist's name
    expect(page).not_to have_content marley.name
  end
end
