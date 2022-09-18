# frozen_string_literal: true

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
        expect(report).to eq '1,1,NORTH'
      end
    end

    context 'with multiple commands' do
      context 'scenario one' do
        # PLACE 0,0,NORTH
        # MOVE
        # REPORT
        # Output: '0,1,NORTH'

        let(:position) { Position.new(0, 0, 'NORTH') }
        let(:report) { Commands::Report.new(robot).run }

        before do
          Commands::Place.new(robot, board, position).run
          Commands::Move.new(robot, board).run
        end

        it 'should report the robots current position' do
          expect(report).to eq '0,1,NORTH'
        end
      end

      context 'scenario two' do
        # PLACE 0,0,NORTH
        # LEFT
        # REPORT
        # Output: '0,0,WEST'

        let(:position) { Position.new(0, 0, 'NORTH') }
        let(:report) { Commands::Report.new(robot).run }

        before do
          Commands::Place.new(robot, board, position).run
          Commands::TurnLeft.new(robot).run
        end

        it 'should report the robots current position' do
          expect(report).to eq '0,0,WEST'
        end
      end

      context 'scenario three' do
        # PLACE 1,2,EAST
        # MOVE
        # MOVE
        # LEFT
        # MOVE
        # REPORT
        # Output: '3,3,NORTH'

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
          expect(report).to eq '3,3,NORTH'
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
        expect(report).to eq 'Robot is not on the board'
      end
    end
  end
end
