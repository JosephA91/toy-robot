# frozen_string_literal: true

require './lib/commands/place'
require './lib/commands/move'
require './lib/commands/turn_right'
require './lib/commands/turn_left'
require './lib/commands/report'

class Simulator
  def initialize(robot, board)
    @robot = robot
    @board = board
  end

  def run(command)
    command_items = command.upcase.delete('\r|\n|,').split.reject(&:empty?)

    case command_items[0]
    when /^PLACE$/
      return unless command_items.count == 4

      x_coord = command_items[1].to_i
      y_coord = command_items[2].to_i
      direction = command_items[3]
      position = Position.new(x_coord, y_coord, direction)

      Commands::Place.new(@robot, @board, position)
    when /^MOVE$/
      Commands::Move.new(@robot, @board)
    when /^RIGHT$/
      Commands::TurnRight.new(@robot)
    when /^LEFT$/
      Commands::TurnLeft.new(@robot)
    when /^REPORT$/
      Commands::Report.new(@robot)
    end
  end
end
