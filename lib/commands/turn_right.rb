# frozen_string_literal: true

require_relative 'base'

module Commands
  class TurnRight < Commands::Base
    def run
      return unless @robot.on_board?

      turn_robot_right!
    end

    private

    def turn_robot_right!
      new_direction = @robot.current_position.turn_right

      @robot.current_position = Position.new(
        @robot.current_position.x_coord,
        @robot.current_position.y_coord,
        new_direction
      )
    end
  end
end
