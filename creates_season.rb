require_relative 'game.rb'
require_relative 'teams.rb'

class CreatesSeason
  def initialize(filename)
    @filename = filename
  end

  def create
    @season = Season.new(2014)
    @season.create_games
    @season.sort_by_date!
    @season.assign_series
  end

  def datify(datestring)
    month, day, year = datestring.split('/')
    Date.new(year,month,day)
  end

  def create_games
    CSV.foreach(@filename, headers: true, header_converters: :symbol) do |row|
      raise "Invalid team" unless MLB.include(row[away].to_sym)
      @season.games << Game.new(datify(row[date]),row[time].to_i,row[away].to_sym)
    end
  end

  def sort_by_date!
    @season.games.sort! { |a,b| a.date <=> b.date}
  end

  def assign_series
  end
  
end

create_season = CreatesSeason.new('sample_draft.csv')
create_season.create