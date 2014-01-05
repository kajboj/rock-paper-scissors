require_relative '../bot'

require 'pry'

describe Bot do
  subject { described_class }

  specify '.start' do
    subject.start({'game' => 'params'}).should == nil
  end

  specify '.opponent_move' do
    subject.opponent_move('opponent move').should == nil
  end

  specify '.move' do
    subject.move.should == 'SCISSORS'
  end

  specify '.dump_history' do
    subject.dump_history.should =~ /SCISSORS/
  end
end