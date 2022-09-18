# frozen_string_literal: true

require 'spec_helper'

require './lib/commands/report'
require './lib/commands/place'
require './lib/commands/move'
require './lib/commands/turn_left'
require './lib/robot'
require './lib/board'
require './lib/position'

describe Commands::Report do
  describe '#run' do
    let(:robot) { Robot.new }
    let(:board) { Board.new }

    context 'with a valid position' do
      let(:position) { Position.new(1, 1, 'NORTH') }
      let(:report) { Commands::Report.new(robot).run }

      before do
        Commands::Place.new(robot, board, position).run
      end

      it 'should report the robots current position' do
        expect { report }.to output("1,1,NORTH\n").to_stdout
      end
    end

    context 'with multiple commands' do
      context 'scenario one' do
        # PLACE 0,0,NORTH
        # MOVE
        # REPORT
        # Output: 0,1,NORTH

        let(:position) { Position.new(0, 0, 'NORTH') }
        let(:report) { Commands::Report.new(robot).run }

        before do
          Commands::Place.new(robot, board, position).run
          Commands::Move.new(robot, board).run
        end

        it 'should report the robots current position' do
          expect { report }.to output("0,1,NORTH\n").to_stdout
        end
      end

      context 'scenario two' do
        # PLACE 0,0,NORTH
        # LEFT
        # REPORT
        # Output: 0,0,WEST

        let(:position) { Position.new(0, 0, 'NORTH') }
        let(:report) { Commands::Report.new(robot).run }

        before do
          Commands::Place.new(robot, board, position).run
          Commands::TurnLeft.new(robot).run
        end

        it 'should report the robots current position' do
          expect { report }.to output("0,0,WEST\n").to_stdout
        end
      end

      context 'scenario three' do
        # PLACE 1,2,EAST
        # MOVE
        # MOVE
        # LEFT
        # MOVE
        # REPORT
        # Output: 3,3,NORTH

        let(:position) { Position.new(1, 2, 'EAST') }
        let(:report) { Commands::Report.new(robot).run }

        before do
          Commands::Place.new(robot, board, position).run
          Commands::Move.new(robot, board).run
          Commands::Move.new(robot, board).run
          Commands::TurnLeft.new(robot).run
          Commands::Move.new(robot, board).run
        end

        it 'should report the robots current position' do
          expect { report }.to output("3,3,NORTH\n").to_stdout
        end
      end
    end

    context 'with a invalid position' do
      let(:position) { Position.new(-1, 1, 'NORTH') }
      let(:report) { Commands::Report.new(robot).run }

      before do
        Commands::Place.new(robot, board, position).run
      end

      it 'should report the robots current position' do
        expect { report }.to output("Robot is not on the board\n").to_stdout
      end
    end
  end
end
