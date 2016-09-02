require 'rails_helper'

RSpec.feature "User views all artists"
  scenario "they see the page for all artists" do
    # As a user
    # Given that artists exist in the database
    marley_image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    dylan_image  = "https://cdn.pastemagazine.com/www/blogs/lists/2011/05/25/bob_dylan_4.jpg"
    marley = Artist.create(name: "Bob Marley", image_path: marley_image)
    dylan  = Artist.create(name: "Bob Dylan",  image_path: dylan_image)
    # When I visit the artists index
    visit artists_path
    # Then I should see each artist's name
    expect(page).to have_content "Bob Marley"
    expect(page).to have_content "Bob Dylan"
    # And each name should link to that artist's individual page
    expect(page).to have_css("a href=\"#{artist_path(marley)}\"")
    expect(page).to have_css("a href=\"#{artist_path(dylan)}\"")
  end
end
