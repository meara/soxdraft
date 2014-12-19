require_relative 'game.rb'
require_relative 'teams.rb'

class CreatesGame
  def initialize(params)
    @params = params
    @success = false
  end

  def run
    Game.new(params)
  end

end