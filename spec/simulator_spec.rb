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
    let(:report) { simulator.run('REPORT') }

    context 'when the commands are valid' do
      context 'places and moves' do
        # PLACE 0,0,NORTH
        # MOVE
        # REPORT
        # Output: 0,1,NORTH

        let(:commands) do
          ['PLACE 0,0,NORTH', 'MOVE']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("0,1,NORTH\n").to_stdout
        end
      end

      context 'places and turns left' do
        # PLACE 0,0,NORTH
        # LEFT
        # REPORT
        # Output: 0,0,WEST

        let(:commands) do
          ['PLACE 0,0,NORTH', 'LEFT']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("0,0,WEST\n").to_stdout
        end
      end

      context 'places and turns right' do
        # PLACE 0,0,NORTH
        # RIGHT
        # REPORT
        # Output: 0,0,EAST

        let(:commands) do
          ['PLACE 0,0,NORTH', 'RIGHT']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("0,0,EAST\n").to_stdout
        end
      end

      context 'executes multiple commands' do
        # PLACE 1,2,EAST
        # MOVE
        # MOVE
        # LEFT
        # MOVE
        # REPORT
        # Output: 3,3,NORTH

        let(:commands) do
          ['PLACE 1,2,EAST', 'MOVE', 'MOVE', 'LEFT', 'MOVE']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("3,3,NORTH\n").to_stdout
        end
      end

      context 'keep robot on the board' do
        # PLACE 4,4,NORTH
        # MOVE
        # MOVE
        # MOVE
        # MOVE
        # MOVE
        # REPORT
        # Output: 4,4,NORTH

        let(:commands) do
          ['PLACE 4,4,NORTH', 'MOVE', 'MOVE', 'MOVE', 'MOVE', 'MOVE']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("4,4,NORTH\n").to_stdout
        end
      end

      context 'when the commands are lowercase' do
        let(:commands) do
          ['place 1,2,east', 'move', 'move', 'left', 'move']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("3,3,NORTH\n").to_stdout
        end
      end

      context 'when the commands include spaces' do
        let(:commands) do
          ['  place 1,2,east ', ' move ', '  move ', ' left ', '   move']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("3,3,NORTH\n").to_stdout
        end
      end
    end

    context 'when commands are invlaid' do
      context 'when the inital place command is invalid' do
        let(:command) { 'PLACE' }

        it 'ignores commands before robot is placed' do
          simulator.run(command)

          expect { report }.to output("Robot is not on the board\n").to_stdout
        end
      end

      context 'when the inital place command has an invalid direction' do
        let(:command) { 'PLACE 1,1,1' }

        it 'ignores commands before robot is placed' do
          simulator.run(command)

          expect { report }.to output("Robot is not on the board\n").to_stdout
        end
      end

      context 'when the inital place command has an incorrectly spelled direction' do
        let(:command) { 'PLACE 1,1,NORTHH' }

        it 'ignores commands before robot is placed' do
          simulator.run(command)

          expect { report }.to output("Robot is not on the board\n").to_stdout
        end
      end

      context 'when the inital place command has an invalid position' do
        let(:command) { 'PLACE e,t,NORTH' }

        it 'ignores commands before robot is placed' do
          simulator.run(command)

          expect { report }.to output("Robot is not on the board\n").to_stdout
        end
      end

      context 'when the commands include invalid items' do
        let(:commands) do
          ['place 1,2,east', 'move', 'move', 'dsfqwfqwef', 'left', 'wefefwq wefqwef', 'move']
        end

        it 'successfully runs and reports the commands' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("3,3,NORTH\n").to_stdout
        end
      end

      context 'when the robot is placed off the board' do
        let(:commands) do
          ['place 9,20,east', 'move']
        end

        it 'does not place the robot and returns an error message' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("Robot is not on the board\n").to_stdout
        end
      end

      context 'when the robot is not placed' do
        let(:commands) do
          %w[right left move]
        end

        it 'ignores commands before robot is placed' do
          commands.each do |command|
            simulator.run(command)
          end

          expect { report }.to output("Robot is not on the board\n").to_stdout
        end
      end
    end
  end
end
