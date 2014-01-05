class Match
  def initialize(points_to_win, max_rounds, dynamite_count, random_move_generator = nil)
    @points_to_win  = points_to_win
    @max_rounds     = max_rounds
    @dynamite_count = dynamite_count

    @random_move_generator = random_move_generator || lambda do
      [
        'ROCK',
        'PAPER',
        'SCISSORS',
        'DYNAMITE'
      ].sample
    end
  end

  def move
    @random_move_generator.call
  end

  def opponent_move(move)
  end
end