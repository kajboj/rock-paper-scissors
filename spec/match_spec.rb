require_relative '../match'

describe Match do
  subject do
    described_class.new(
      points_to_win, max_rounds, dynamite_count, random_move_generator)
  end

  let(:points_to_win)  { 3 }
  let(:max_rounds)     { 6 }
  let(:dynamite_count) { 2 }

  let(:random_move_generator) do
    lambda { 'SCISSORS' }
  end

  specify do
    subject.move.should == 'SCISSORS'
    subject.move.should == 'SCISSORS'
  end
end