# frozen_string_literal: true

require 'commands/base'

module Commands
  class Move < Commands::Base
    def run
      return unless @robot.on_board?

      new_position = @robot.current_position.move(@robot.current_position.direction)

      @robot.current_position = new_position if @board.valid_position?(new_position)
    end
  end
end
