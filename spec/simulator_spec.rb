# frozen_string_literal: true

require 'spec_helper'

require './lib/simulator'
require './lib/position'
require './lib/robot'
require './lib/board'

describe Simulator do
  let(:robot) { Robot.new }
  let(:board) { Board.new }
  let(:simulator) { Simulator.new(robot, board) }

  describe '#run' do
    context 'when the command is valid' do
      context '#PLACE' do
        let(:place_command) { 'PLACE 1, 1, NORTH' }
        let(:position_mock) { instance_double(Position, x_coord: 1, y_coord: 1, direction: 'NORTH') }

        it 'receives the place command' do
          expect(Position).to receive(:new).with(1, 1, 'NORTH').and_return(position_mock)
          expect(Commands::Place).to receive(:new).with(robot, board, position_mock)

          simulator.run(place_command)
        end

        it 'returns a place command' do
          expect(simulator.run(place_command)).to be_a Commands::Place
        end
      end

      context '#MOVE' do
        let(:move_command) { 'MOVE' }

        it 'receives the move command' do
          expect(Commands::Move).to receive(:new).with(robot, board)

          simulator.run(move_command)
        end

        it 'returns a move command' do
          expect(simulator.run(move_command)).to be_a Commands::Move
        end
      end

      context '#RIGHT' do
        let(:right_command) { 'RIGHT' }

        it 'receives the command' do
          expect(Commands::TurnRight).to receive(:new).with(robot)

          simulator.run(right_command)
        end

        it 'returns a turn right command' do
          expect(simulator.run(right_command)).to be_a Commands::TurnRight
        end
      end

      context '#LEFT' do
        let(:left_command) { 'LEFT' }

        it 'receives the command' do
          expect(Commands::TurnLeft).to receive(:new).with(robot)

          simulator.run(left_command)
        end

        it 'returns a turn left command' do
          expect(simulator.run(left_command)).to be_a Commands::TurnLeft
        end
      end

      context '#REPORT' do
        let(:report_command) { 'REPORT' }

        it 'receives the command' do
          expect(Commands::Report).to receive(:new).with(robot)

          simulator.run(report_command)
        end

        it 'returns a report command' do
          expect(simulator.run(report_command)).to be_a Commands::Report
        end
      end
    end

    context 'when the command is invalid' do
      let(:invalid_command) { 'PLACE' }

      it 'returns nil' do
        expect(simulator.run(invalid_command)).to be nil
      end
    end
  end
end
