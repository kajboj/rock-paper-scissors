require_relative '../move_probability'

describe MoveProbability do
  subject { described_class.new }

  it 'returns uniform probs when no moves from opponent' do
    subject.array.should == [
      'ROCK',
      'PAPER',
      'SCISSORS'
    ]
  end

  it 'returns winning move for each opponents move' do
    subject.opponent_move('ROCK')
    subject.opponent_move('PAPER')
    subject.opponent_move('SCISSORS')

    subject.array.should == ['PAPER', 'SCISSORS', 'ROCK']
  end

  it 'ignores DYNAMITE and WATERBOMB' do
    subject.opponent_move('DYNAMITE')
    subject.opponent_move('WATERBOMB')
    subject.opponent_move('ROCK')

    subject.array.should == ['PAPER']
  end
end