class MoveProbability
  def initialize
    @a = []
  end

  def array
    return default if @a.empty?
    @a
  end

  def opponent_move(move)
    unless %(DYNAMITE WATERBOMB).include?(move)
      @a << winning_move(move)
    end
  end

  private

  def winning_move(move)
    {
      'ROCK'     => 'PAPER',
      'PAPER'    => 'SCISSORS',
      'SCISSORS' => 'ROCK'
    }.fetch(move)
  end

  def default
    [
      'ROCK',
      'PAPER',
      'SCISSORS'
    ]
  end
end