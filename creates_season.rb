require_relative 'game.rb'
require_relative 'teams.rb'

class CreatesSeason
  def initialize(filename)
    @filename = filename
  end

  def read_in_games
    file = File.new(filename)
    header, game_lines = file.read.split("\n")
    file.close
    params = {date: datify(date), time: time, away: away.to_sym}
  end

  def datify(datestring)
    month, day, year = datestring.split('/')
    Date.new(year,month,day)
  end
end

create_season = CreatesSeason.new('sample_draft.csv')


# def load_file
#   file = File.new(filename)
#   total_string, *item_data = file.read.split("\n")
#   file.close
#   {total_string: total_string, item_data: item_data}
# end