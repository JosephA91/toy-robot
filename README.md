# Toy Robot
A Ruby program to simulate the toy robot.

## Problem
Please refer to PROBLEM.md for the specific requirements for this project.

## Setup

### With Docker

#### 1. Build the container
```
docker build -t toy-robot .
```

#### 2. Run the container
```
docker run -it toy-robot sh
```

The container will open inside of an interactive terminal session, where you can either play the game or run the test suite.

#### 3. Exit the container
To exit the interactive terminal session and stop the container, simply type `exit` and press ENTER.

### Without Docker (using Ruby locally)

#### Prepare
```
bundle install
```

## Playing the Toy Robot game
Once you have setup the project (either using docker or installed locally) you can play the game.
```
ruby lib/main.rb
```

## Running the tests
Once you have setup the project (either using docker or installed locally) you can run the test suites.

#### Run all tests
```
rspec
```

#### Run one test file
```
rspec <file_path>
```

#### Run rubocop
```
rubocop
```

## Test data for the game

### Scenario 1: Can place robot and move
#### Commands:
```
PLACE 0,0,NORTH
MOVE
REPORT
```
Output: 0,1,NORTH

### Scenario 2: Can place robot and turn left
#### Commands:
```
PLACE 0,0,NORTH
LEFT
REPORT
```
Output: 0,0,WEST

### Scenario 3: Can place robot and turn right
#### Commands:
```
PLACE 0,0,NORTH
RIGHT
REPORT
```
Output: 0,0,EAST

### Scenario 4: Can place robot and execute multiple commands
#### Commands:
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
Output: 3,3,NORTH

### Scenario 5: Can place robot and keep on the board
#### Commands:
```
PLACE 4,4,NORTH
MOVE
MOVE
MOVE
MOVE
MOVE
REPORT
```
Output: 4,4,NORTH