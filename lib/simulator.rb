# frozen_string_literal: true

require_relative 'commands/place'
require_relative 'commands/move'
require_relative 'commands/turn_right'
require_relative 'commands/turn_left'
require_relative 'commands/report'
require_relative 'position'

class Simulator
  def initialize(robot, board)
    @robot = robot
    @board = board
  end

  def run(command)
    command_items = command.upcase.upcase.gsub(',', ' ').split.reject(&:empty?)

    case command_items[0]
    when /^PLACE$/
      return unless command_items.count == 4

      x_coord = command_items[1].to_i
      y_coord = command_items[2].to_i
      direction = command_items[3]
      position = Position.new(x_coord, y_coord, direction)

      Commands::Place.new(@robot, @board, position).run
    when /^MOVE$/
      Commands::Move.new(@robot, @board).run
    when /^RIGHT$/
      Commands::TurnRight.new(@robot).run
    when /^LEFT$/
      Commands::TurnLeft.new(@robot).run
    when /^REPORT$/
      Commands::Report.new(@robot).run
    end
  end
end
