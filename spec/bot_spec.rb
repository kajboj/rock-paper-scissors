require_relative '../bot'

require 'pry'

describe Bot do
  subject { described_class }

  specify '.opponent_move' do
    subject.opponent_move.should == nil
  end

  its(:move) { should == 'SCISSORS' }
end