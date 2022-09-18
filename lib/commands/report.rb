# frozen_string_literal: true

module Commands
  class Report < Commands::Base
    ROBOT_NOT_ON_BOARD_MESSAGE = 'Robot is not on the board'

    def run
      return ROBOT_NOT_ON_BOARD_MESSAGE unless @robot.on_board?

      report_robot_position
    end

    private

    def report_robot_position
      "#{current_position.x_coord},#{current_position.y_coord},#{current_position.direction}"
    end

    def current_position
      @current_position ||= @robot.current_position
    end
  end
end
