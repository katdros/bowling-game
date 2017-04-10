require_relative "./bowling/bowling_game"

frames = eval(ARGV.first)
bowling_game = BowlingGame.new(frames)
p bowling_game.score