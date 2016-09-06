require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the page for the individual playlist" do
    # As a user
    # Given that a playlist and songs exist in the database
    playlist = create(:playlist_with_songs)
    song_one, song_two, song_three = playlist.songs
    new_song = create(:song, title: "New Song")
    # When I visit that playlist's show page
    visit playlist_path(playlist)
    # And I click on "Edit"
    click_on "Edit"
    # And I enter a new playlist name
    fill_in "playlist_name", with: "Arbitrary New Playlist Name"
    # And I select an additional song
    check "song-#{new_song.id}"
    # And I uncheck an existing song
    uncheck "song-#{song_one.id}"
    # And I click on "Update Playlist"
    click_on "Update Playlist"
    # Then I should see the playlist's updated name
    expect(page).to have_content "Arbitrary New Playlist Name"
    # And I should see the name of the newly added song
    expect(page).to have_content new_song.title
    # And I should not see the name of the removed song
    expect(page).not_to have_content song_one.title
# byebug
  end
end
