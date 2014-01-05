require './game_store'

class Bot
  def self.start(match_params)
    store.start(match_params)
    nil
  end

  def self.move
    move = 'SCISSORS'
    store.move(move)
    move
  end

  def self.opponent_move(move)
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
end