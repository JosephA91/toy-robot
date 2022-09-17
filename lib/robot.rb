# frozen_string_literal: true

class Robot
  attr_accessor :current_position

  def initialize
    @current_position = nil
  end

  def placed?
    !@current_position.nil?
  end
end
