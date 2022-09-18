# frozen_string_literal: true

require_relative 'base'

module Commands
  class Move < Commands::Base
    def run
      return unless @robot.on_board?

      move_robot_forward!
    end

    private

    def move_robot_forward!
      new_position = @robot.current_position.move(@robot.current_position.direction)

      @robot.current_position = new_position if @board.valid_position?(new_position)
    end
  end
end
