# frozen_string_literal: true

class Board
  attr_reader :width, :height

  DEFAULT_HEIGHT = 5
  DEFAULT_WITDTH = 5

  def initialize(height: DEFAULT_HEIGHT, width: DEFAULT_WITDTH)
    @height = height
    @width = width
  end

  def valid_position?(position)
    position.x_coord >= 0 &&
      position.y_coord >= 0 &&
      position.x_coord < height &&
      position.y_coord < height
  end
end
