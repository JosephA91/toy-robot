# frozen_string_literal: true

require 'commands/base'

module Commands
  class Place < Commands::Base
    def run
      @robot.current_position = @position if @board.valid_position?(@position)
    end
  end
end
