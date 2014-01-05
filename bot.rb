require './game_store'
require './match'

class Bot
  def self.start(match_params)
    store.start(match_params)
    start_match(match_params)
    nil
  end

  def self.move
    move = match.move
    store.move(move)
    move
  end

  def self.opponent_move(move)
    match.opponent_move(move)
    store.opponent_move(move)
    nil
  end

  def self.dump_history
    store.dump_history
  end

  private

  def self.store
    @store ||= GameStore.new(10_000)
  end

  def self.match
    @match
  end

  def self.start_match(params)
    @match = Match.new(
      params['pointsToWin'],
      params['maxRounds'],
      params['dynamiteCount']
    )
  end
end