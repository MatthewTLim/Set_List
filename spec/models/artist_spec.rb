require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
    before do
      @prince = Artist.create!(name: 'Prince')
      @purple = @prince.songs.create!(title: 'Purple Rain', length: 150, play_count: 6584)
      @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 190, play_count: 984)

    end
      it 'returns the average song length' do
        expect(@prince.average_song_length).to eq(170)
      end
    end
  end
end