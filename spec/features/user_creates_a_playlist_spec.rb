require 'rails_helper'

RSpec.feature "User submits a new playlist" do
  scenario "they see the page for individual playlist" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist_name = "Arbitrary Playlist Name"
    # As a user
    # Given that songs and artists exist in the database
    # When I visit the playlists path
    visit playlists_path
    # And I click "New playlist"
    click_on "New playlist"
    # And I fill in a name
    fill_in "playlist_name", with: playlist_name
    # And I select the songs for the playlist
    check "song-#{song_one.id}"
    check "song-#{song_three.id}"
    # And I click "Create Playlist"
    click_on "Create Playlist"
    # Then I see the playlist title
    expect(page).to have_content playlist_name
    # And I see the titles of all songs in that playlist
    # And the titles should link to the individual song pages
    within("li:first") do
      expect(page).to have_link song_one.title, href: song_path(song_one)
    end

    within("li:last") do
      expect(page).to have_link song_three.title, href: song_path(song_three)
    end
  end
end
