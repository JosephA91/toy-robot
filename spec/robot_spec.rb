# frozen_string_literal: true

require './lib/robot'
require './lib/position'

describe Robot do
  describe '#current_position' do
    context 'when position is not set' do
      let(:robot) { Robot.new }

      it 'returns nil' do
        expect(robot.current_position).to eq nil
      end
    end

    context 'when position is set' do
      let(:robot) { Robot.new }
      let(:position) { Position.new(1, 1, 'NORTH') }

      it 'returns a valid position' do
        robot.current_position = position

        expect(robot.current_position).to eq position
      end
    end
  end

  describe '#on_board?' do
    context 'when robot is placed on the board' do
      let(:robot) { Robot.new }
      let(:position) { Position.new(1, 1, 'NORTH') }

      it 'returns true' do
        robot.current_position = position

        expect(robot.on_board?).to be true
      end
    end

    context 'when robot is not placed on the board' do
      let(:robot) { Robot.new }

      it 'returns false' do
        expect(robot.on_board?).to be false
      end
    end
  end
end
