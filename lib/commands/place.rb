# frozen_string_literal: true

require_relative 'base'

module Commands
  class Place < Commands::Base
    def run
      set_robot_position!
    end

    private

    def set_robot_position!
      @robot.current_position = @position if @board.valid_position?(@position)
    end
  end
end
