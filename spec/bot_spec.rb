require_relative '../bot'

require 'pry'

describe Bot do
  subject { described_class }

  let(:game_store) do
    double('game store', opponent_move: nil)
  end

  specify '.start' do
    subject.start({'game' => 'params'}).should == nil
  end

  specify '.opponent_move' do
    subject.opponent_move('opponent move').should == nil
  end

  specify '.move' do
    subject.move.should == 'SCISSORS'
  end
end