class Season

  attr_accessor :games
  def initialize(year)
    @year = year
    @games = []
  end
end