require_relative 'game.rb'
require_relative 'teams.rb'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation 
end

describe Game do

  let(:sunday_game) { Game.new(Date.new(2014,12,21), 1205, :min, 2) }
  let(:saturday_game) { Game.new(Date.new(2014,12,20), 1305, :min, 2) }
  let(:thursday_night_game) { Game.new(Date.new(2014,12,18), 1705, :min, 1)}

  context '#day_game?' do
    it 'returns true for a day game' do
      expect(sunday_game.day_game?).to eq true
    end

    it 'returns false for a night game' do
      expect(thursday_night_game.day_game?).to eq false
    end
  end

  context '#night_game?' do
    it 'returns true for a night game' do
      expect(thursday_night_game.night_game?).to eq true
    end

    it 'returns false for a day game' do
      expect(sunday_game.night_game?).to eq false
    end
  end

  context '#weekend?' do
    it 'returns true for a weekend game' do
      expect(sunday_game.weekend?).to eq true
    end
    it 'returns false for a weekday game' do
      expect(thursday_night_game.weekend?).to eq false
    end
  end

  context '#weekday?' do
    it 'returns true for a weekday game' do
      expect(thursday_night_game.weekday?).to eq true
    end
    it 'returns false for a weekend game' do
      expect(sunday_game.weekday?).to eq false
    end
  end

  context '#same_series?' do
    it 'returns true if games are in same series' do
      expect(saturday_game.same_series?(sunday_game)).to eq true
    end
    it 'returns false if games are not in same series' do
      expect(thursday_night_game.same_series?(sunday_game)).to eq false
    end
  end

end