require './move_probability'

class Match
  def initialize(points_to_win, max_rounds, dynamite_count, random_move_generator = nil)
    @points_to_win  = points_to_win
    @max_rounds     = max_rounds
    @dynamite_count = dynamite_count

    @move_probability = MoveProbability.new

    @random_move_generator = random_move_generator || lambda do
      @move_probability.array.sample
    end

    @tie = false

    @opponent_dynamite_count = dynamite_count
  end

  def move
    if @tie and @dynamite_count > 0
      move = [
        'DYNAMITE',
        'WATERBOMB'
      ].sample
    else
      move = @random_move_generator.call
    end

    @dynamite_count -= 1 if move == 'DYNAMITE'
    @last_move = move
    move
  end

  def opponent_move(move)
    @move_probability.opponent_move(move)
    if @last_move == move
      @tie = true
    else
      @tie = false
    end
  end
end