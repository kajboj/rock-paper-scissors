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
    move = @random_move_generator.call

    if move == 'DYNAMITE' and @dynamite_count <= 0
      while move == 'DYNAMITE' do
        move = @random_move_generator.call
      end
    end

    @dynamite_count -= 1 if move == 'DYNAMITE'
    move
  end

  def opponent_move(move)
  end
end