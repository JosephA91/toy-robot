# frozen_string_literal: true

require 'commands/base'

module Commands
  class TurnLeft < Commands::Base
    def run
      return unless @robot.on_board?

      turn_robot_left!
    end

    private

    def turn_robot_left!
      new_direction = @robot.current_position.turn_left

      @robot.current_position = Position.new(
        @robot.current_position.x_coord,
        @robot.current_position.y_coord,
        new_direction
      )
    end
  end
end
