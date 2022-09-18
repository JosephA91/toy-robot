# frozen_string_literal: true

require './lib/board'
require './lib/robot'
require './lib/position'
require './lib/commands/turn_left'

describe Commands::TurnLeft do
  describe '#run' do
    context 'when the robot is placed on the board' do
      let(:robot) { Robot.new }

      before(:each) do
        robot.current_position = position
        Commands::TurnLeft.new(robot).run
      end

      context 'when the robot is facing NORTH' do
        let(:position) { Position.new(1, 1, 'NORTH') }
        let(:new_position) { Position.new(1, 1, 'WEST') }

        it 'should face the robot WEST' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end

      context 'when the robot is facing EAST' do
        let(:position) { Position.new(1, 1, 'EAST') }
        let(:new_position) { Position.new(1, 1, 'NORTH') }

        it 'should face the robot NORTH' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end

      context 'when the robot is facing SOUTH' do
        let(:position) { Position.new(1, 1, 'SOUTH') }
        let(:new_position) { Position.new(1, 1, 'EAST') }

        it 'should face the robot EAST' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end

      context 'when the robot is facing WEST' do
        let(:position) { Position.new(1, 1, 'WEST') }
        let(:new_position) { Position.new(1, 1, 'SOUTH') }

        it 'should face the robot SOUTH' do
          expect(robot.current_position.x_coord).to eq new_position.x_coord
          expect(robot.current_position.y_coord).to eq new_position.y_coord
          expect(robot.current_position.direction).to eq new_position.direction
        end
      end
    end

    context 'when the robot is not placed on the board' do
      let(:robot) { Robot.new }

      it 'should not turn the robot left' do
        Commands::TurnLeft.new(robot).run

        expect(robot.current_position).to eq nil
      end
    end
  end
end
