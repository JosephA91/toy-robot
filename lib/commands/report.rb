# frozen_string_literal: true

require_relative 'base'

module Commands
  class Report < Commands::Base
    ROBOT_NOT_ON_BOARD_MESSAGE = 'Robot is not on the board'

    def run
      puts report_robot_position
    end

    private

    def report_robot_position
      return ROBOT_NOT_ON_BOARD_MESSAGE unless @robot.on_board?

      "#{current_position.x_coord},#{current_position.y_coord},#{current_position.direction}"
    end

    def current_position
      @current_position ||= @robot.current_position
    end
  end
end
