# frozen_string_literal: true

require './lib/commands/place'
require './lib/robot'
require './lib/board'
require './lib/position'

describe Commands::Place do
  describe '#run' do
    let(:robot) { Robot.new }
    let(:board) { Board.new }

    before(:each) do
      Commands::Place.new(robot, board, position).run
    end

    context 'with a valid position' do
      context 'with NORTH direction' do
        let(:position) { Position.new(1, 1, 'NORTH') }

        it 'places the robot on the board' do
          expect(robot.current_position).to eq position
        end
      end

      context 'with EAST direction' do
        let(:position) { Position.new(1, 1, 'EAST') }

        it 'places the robot on the board' do
          expect(robot.current_position).to eq position
        end
      end

      context 'with SOUTH direction' do
        let(:position) { Position.new(1, 1, 'SOUTH') }

        it 'places the robot on the board' do
          expect(robot.current_position).to eq position
        end
      end

      context 'with WEST direction' do
        let(:position) { Position.new(1, 1, 'WEST') }

        it 'places the robot on the board' do
          expect(robot.current_position).to eq position
        end
      end
    end

    context 'with an invalid position' do
      let(:position) { Position.new(9, 9, 'NORTH') }

      it 'does not place the robot on the board' do
        expect(robot.current_position).to eq nil
      end
    end
  end
end
