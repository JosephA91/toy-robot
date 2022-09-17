# frozen_string_literal: true

class Position
  attr_reader :x_coord, :y_coord, :direction

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze
  MOVE_LENGTH = 1

  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def move(direction)
    return unless DIRECTIONS.include?(direction)

    move_in_direction(direction)
  end

  def right
    DIRECTIONS[(DIRECTIONS.index(direction) + 1) % DIRECTIONS.length]
  end

  def left
    DIRECTIONS[(DIRECTIONS.index(direction) - 1) % DIRECTIONS.length]
  end

  private

  def move_in_direction(direction)
    case direction
    when 'NORTH'
      Position.new(@x_coord, @y_coord + MOVE_LENGTH, @direction)
    when 'EAST'
      Position.new(@x_coord + MOVE_LENGTH, @y_coord, @direction)
    when 'SOUTH'
      Position.new(@x_coord, @y_coord - MOVE_LENGTH, @direction)
    when 'WEST'
      Position.new(@x_coord - MOVE_LENGTH, @y_coord, @direction)
    end
  end
end
