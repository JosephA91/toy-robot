# frozen_string_literal: true

module Commands
  class Base
    def initialize(robot = nil, board = nil, position = nil)
      @robot = robot
      @board = board
      @position = position
    end
  end
end
