# frozen_string_literal: true

require './lib/commands/move'
require './lib/robot'
require './lib/board'
require './lib/position'

describe Commands::Move do
  describe '#run' do
    context 'when the robot is placed on the board' do
      let(:robot) { Robot.new }
      let(:board) { Board.new }

      before(:each) do
        robot.current_position = position
        Commands::Move.new(robot, board).run
      end

      context 'when the robot is facing NORTH' do
        let(:position) { Position.new(1, 1, 'NORTH') }
        let(:new_position) { Position.new(1, 2, 'NORTH') }

        it 'should move the robot NORTH' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end

      context 'when the robot is facing EAST' do
        let(:position) { Position.new(1, 1, 'EAST') }
        let(:new_position) { Position.new(2, 1, 'EAST') }

        it 'should move the robot EAST' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end

      context 'when the robot is facing SOUTH' do
        let(:position) { Position.new(1, 1, 'SOUTH') }
        let(:new_position) { Position.new(1, 0, 'SOUTH') }

        it 'should move the robot SOUTH' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end

      context 'when the robot is facing WEST' do
        let(:position) { Position.new(1, 1, 'WEST') }
        let(:new_position) { Position.new(0, 1, 'WEST') }

        it 'should move the robot WEST' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end
    end

    context 'when the robot is not placed on the board' do
      let(:robot) { Robot.new }
      let(:board) { Board.new }

      it 'should not move the robot' do
        Commands::Move.new(robot, board).run

        expect(robot.current_position).to eq nil
      end
    end
  end
end
