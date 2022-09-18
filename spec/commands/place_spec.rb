# frozen_string_literal: true

require './lib/board'
require './lib/robot'
require './lib/position'
require './lib/commands/place'

describe Commands::Place do
  describe '#run' do
    let(:robot) { Robot.new }
    let(:board) { Board.new }

    context 'with a valid position' do
      let(:position) { Position.new(1, 1, 'NORTH') }

      it 'places the robot on the board' do
        Commands::Place.new(robot, board, position).run

        expect(robot.current_position).to eq position
      end
    end

    context 'with an invalid position' do
      let(:position) { Position.new(9, 9, 'NORTH') }

      it 'does not place the robot on the board' do
        Commands::Place.new(robot, board, position).run

        expect(robot.current_position).to eq nil
      end
    end
  end
end
