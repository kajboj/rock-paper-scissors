class Bot
  GAMELOG_FILE = './log/game.log'

  def self.start(match_params)
    log(match_params.inspect)
  end

  def self.move
    move = 'SCISSORS'
    log(move) 
    move
  end

  def self.opponent_move(move)
    log(move)
  end

  def self.log(msg)
    File.open(GAMELOG_FILE, 'w') do |f|
      f.write(msg)
    end
  end
end