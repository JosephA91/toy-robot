# frozen_string_literal: true

require_relative 'simulator'
require_relative 'robot'
require_relative 'board'

# initializes a new 5x5 board, a new robot, and a new command simulator
board = Board.new
robot = Robot.new
simulator = Simulator.new(robot, board)

instructions = [
  '# STEP 1: To place Toy Robot use: PLACE X,Y,NORTH|SOUTH|EAST|WEST',
  '# Example: PLACE 0,0,NORTH',
  '# Step 2: To Drive Toy Robot use either: MOVE, RIGHT, LEFT, or REPORT',
  "# Step 3: To exit use: QUIT or EXIT\n\n",
  "To read the Instructions at anytime use: HELP\n\n"
]

puts '# Welcome to the Toy Robot Game'
puts "# Instructions below...\n\n"
instructions.each { |step| puts step }

loop do
  puts 'input command (EXIT to quit) or (HELP for instructions):'

  input = gets

  simulator.run(input)

  puts instructions if input =~ /help/i
  break if input =~ /exit/i
end
