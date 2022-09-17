# frozen_string_literal: true

require './lib/robot'
require './lib/position'

describe Robot do
  # test #current_position - @robot.current_position
  # test #place - Commands::Place.new(robot, board, position).run
  # test #move - Commands::Move.new(robot, board).run
  # test #right - Commands::Right.new(robot).run
  # test #left - Commands::Left.new(robot).run
  # test #report - Commands::Report.new(robot).run

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

  describe '#placed?' do
    context 'when robot is placed on board' do
      let(:robot) { Robot.new }
      let(:position) { Position.new(1, 1, 'NORTH') }

      it 'returns true' do
        robot.current_position = position

        expect(robot.placed?).to be true
      end
    end

    context 'when robot is not placed on board' do
      let(:robot) { Robot.new }

      it 'returns false' do
        expect(robot.placed?).to be false
      end
    end
  end
end
