require_relative '../game_store'

require 'pry'

describe GameStore do
  subject { described_class.new(5) }

  specify 'logging of the history' do
    subject.start({'game' => 'params'})
    subject.move('our move 1')
    subject.opponent_move('opponent move 1')
    subject.move('our move 2')
    subject.opponent_move('opponent move 2')

    subject.dump_history.split("\n").should == [
      '{"game"=>"params"}',
      'our move 1 - opponent move 1',
      'our move 2 - opponent move 2'
    ]
  end

  specify 'log ring' do
    subject.move('1')
    subject.move('2')
    subject.move('3')
    subject.move('4')
    subject.move('5')
    subject.move('6')
    subject.dump_history.should == '23456'
  end
end