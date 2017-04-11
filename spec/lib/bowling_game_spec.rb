require_relative '../spec_helper'
 
describe BowlingGame do
  let(:frames) { [[6,2],[9,1],[1,8],[10],[4,1],[5,2],[0,3],[10],[7,0],[10,7,2]] }

  describe '#initialize' do
    it 'takes an array and returns a BowlingGame object' do
      bowling_game = BowlingGame.new(frames)
      expect(bowling_game.class).to equal(BowlingGame)
    end
  end

  describe '#score' do
    describe 'input is invalid' do
      context 'when there is no input' do
        it 'shows an error ' do
          score = BowlingGame.new(nil).score
          expect(score).to eq("Invalid Input: Game Scores can't be blank.") 
        end
      end

      context 'when given frames are empty' do
        it 'shows an error' do
          score = BowlingGame.new([]).score
          expect(score).to eq("Invalid Input: Game Scores can't be blank.") 
        end
      end

      context 'when number of frames is less than 10' do
        it 'shows an error' do
          score = BowlingGame.new([[1,2]]).score
          expect(score).to eq("Invalid Input: Invalid Frame count (1).") 
        end
      end

      context 'when number of frames is greater than 10' do
        it 'shows an error' do
          score = BowlingGame.new(frames << [1,2]).score
          expect(score).to eq("Invalid Input: Invalid Frame count (11).")
        end
      end
    end

    describe 'input is valid' do
      context 'when frames given have no strike' do      
        it "calculates the score with no additional points" do
          frames          = [[6,2],[9,1],[1,8],[1,0],[4,1],[5,2],[0,3],[1,0],[7,0],[1,0]]
          expected_result = [8, 18, 27, 28, 33, 40, 43, 44, 51, 52]
          score           = BowlingGame.new(frames).score

          expect(score).to eq(expected_result) 
        end
      end

      context 'when frames given have a strike' do 
        it "calculates the score with additional points" do
          expected_result = [8, 18, 27, 42, 47, 54, 57, 74, 81, 100]
          score           = BowlingGame.new(frames).score
          
          expect(score).to eq(expected_result) 
        end
      end

      context 'when frames given are all strikes' do
        it "calculates the score up to 300" do
          frames          = [[10],[10],[10],[10],[10],[10],[10],[10],[10],[10,10,10]]
          expected_result = [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
          score           = BowlingGame.new(frames).score
          
          expect(score).to eq(expected_result) 
        end
      end
    end
  end
end