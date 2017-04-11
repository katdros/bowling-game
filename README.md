# Bowling Game Score Calculator

## Welcome to the bowling game!

This is a simple Ruby script that calculates the score for a ten-pin bowling game.

## Getting Started

1. Make sure you have Ruby installed. ;)

2. Clone this repository.

3. Go to the project root directory.

4. Run the `lib/run_bowling.rb` which takes in an array of frames of your game.

### Sample command:

```
ruby lib/run_bowling.rb "[[6,2],[9,1],[1,8],[10],[4,1],[5,2],[0,3],[10],[7,0],[10,7,2]]"

```

Output:
```
[8, 18, 27, 42, 47, 54, 57, 74, 81, 100]
```

## This Ruby script requires the following rules:

1. There are two kinds of marks given in a score
  a. Strike (all ten down in the first ball)
  b. Spare (all ten down by the second ball)

2. The user should always input a non-empty array of 10 arrays. 

3. A frame should always have an integer value from 0 - 10.

4. Frames 1 - 9 should always have 2 values unless it's a strike which only has 1 value. 

5. The last frame should always have 3 values if it's a strike, otherwise it should have 2 values.

6. Frames 1 - 9 values should have a maximum sum of 10.

7. The last frame values should have:
  a. a maximum sum of 30 if it's a strike and the second throw is a strike as well,
  b. a maximum sum of 20 if it's a strike and the second throw is not a strike,
  c. otherwise, it should have a maximum sum of 10.

8. There will be no additional score for a spare.

9. A strike earns ten points plus the points for the next two balls thrown.

10. The maximum score in ten-pin bowling is 300 if a bowler gets 12 strikes in a row.

## Automated Testing:

The given rules are automatically tested and documented with RSpec. Please checkout the corresponding test cases under `spec`.

First, make sure RSpec is installed :D
```
gem install rspec
```

Then, run this command in the project root directory:
```
rspec spec
```

Enjoy! :)