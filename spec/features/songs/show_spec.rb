require 'rails_helper'

RSpec.describe 'the songs showpage' do
  it 'displays the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 190, play_count: 28403)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 180, play_count: 728403)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of artists for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 190, play_count: 28403)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 180, play_count: 728403)

    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)

  end
end