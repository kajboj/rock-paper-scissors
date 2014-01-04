require_relative '../bot'

require 'pry'

describe Bot do
  subject { described_class }

  let(:game_store) do
    double('game store', opponent_move: nil)
  end

  describe '.start' do
    it 'logs match params' do
      expect_log('{"game"=>"params"}') do
        subject.start({'game' => 'params'})
      end
    end
  end

  describe '.opponent_move' do
    it 'logs move' do
      expect_log('opponent move') do
        subject.opponent_move('opponent move')
      end
    end
  end

  describe '.move' do
    it 'always returns SCISSORS' do
      subject.move.should == 'SCISSORS'
    end

    it 'logs move' do
      expect_log('SCISSORS') do
        subject.move
      end
    end
  end


  def expect_log(expected_content, &blk)
    File.delete(Bot::GAMELOG_FILE) if File.exists?(Bot::GAMELOG_FILE)
    yield if block_given? 
    File.read(Bot::GAMELOG_FILE).should == expected_content
  end
end