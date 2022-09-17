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
`bundle install`

## Playing the Toy Robot game
T.B.C

## Running the tests
Once you have setup the project (either using docker or installed locally) you can run the test suites.

#### Run all tests
`rspec`

#### Run one test file
`rspec <file_path>`