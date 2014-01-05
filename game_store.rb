class GameStore
  def initialize(capacity)
    @log = Array.new(capacity)
    @i = 0
  end

  def start(match_params)
    log(MatchInfo.new(match_params.inspect))
  end

  def move(move)
    log(OurMove.new(move))
  end

  def opponent_move(move)
    log(OpponentMove.new(move))
  end

  def dump_history
    i = @i
    s = ''
    @log.size.times do
      s << @log[i].to_s
      i = next_index(i)
    end
    s
  end

  private

  def next_index(i)
    (i + 1) % @log.size
  end

  def log(message)
    @log[@i] = message
    @i = next_index(@i)
  end

  class LogEntry
    def initialize(string)
      @string = string
    end

    def line_end
      "\n"
    end
  end

  class MatchInfo < LogEntry
    def to_s
      @string + line_end
    end
  end

  class OurMove < LogEntry
    def to_s
      @string
    end
  end

  class OpponentMove < LogEntry
    def to_s
      ' - ' + @string + line_end
    end
  end
end