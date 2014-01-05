require_relative '../match'

describe Match do
  subject do
    described_class.new(
      points_to_win, max_rounds, dynamite_count, random_move_generator)
  end

  let(:points_to_win)  { 3 }
  let(:max_rounds)     { 6 }
  let(:dynamite_count) { 2 }

  describe 'playing random moves' do
    let(:random_move_generator) do
      lambda { 'SCISSORS' }
    end

    specify do
      subject.move.should == 'SCISSORS'
      subject.move.should == 'SCISSORS'
    end
  end

  describe 'playing dynamite or waterbomb after tie' do
    let(:random_move_generator) do
      sequence = %w(SCISSORS SCISSORS SCISSORS)
      lambda { sequence.pop }
    end

    specify do
      subject.move.should == 'SCISSORS'
      subject.opponent_move('SCISSORS')

      subject.move.should == 'DYNAMITE'
      subject.opponent_move('DYNAMITE')

      subject.move.should == 'DYNAMITE'
      subject.opponent_move('DYNAMITE')

      subject.move.should == 'SCISSORS'
    end
  end

  describe 'no blow ups' do
    let(:random_move_generator) { nil }

    specify do
      10000.times do
        subject.move
        subject.opponent_move(
          %w(ROCK PAPER SCISSORS DYNAMITE WATERBOMB).sample
        )
      end
    end
  end
end