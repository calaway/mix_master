require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see the page for all playlists" do
    # As a user
    # Given that playlists exist in the database
    playlist_one, playlist_two = create_list(:playlist, 2)
    # When I visit the playlists index
    visit playlists_path
    # Then I should see each playlist's name
    # And each name should link to that playlist's individual page
    within("li:first") do
      expect(page).to have_link playlist_one.name, playlist_path(playlist_one)
    end

    within("li:last") do
      expect(page).to have_link playlist_two.name, playlist_path(playlist_two)
    end
  end
end
