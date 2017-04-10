require_relative '../spec_helper'
 
describe LastFrame do
  describe '#score' do
    context 'when given frame is a strike' do
      context 'when given frame has 3 inputs' do
        it 'calculates the score' do
          frame = LastFrame.new([10,9,1])
          expect(frame.score).to eq(20)
        end
      end

      context 'when given frame has 2 inputs' do
        it 'raises an error' do
          frame = LastFrame.new([10, 2])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [10, 2]. Invalid number of throws.')
        end
      end
    end

    context 'when given frame is not a strike' do
      context 'when given frame has 3 inputs' do
        it 'raises an error' do
          frame = LastFrame.new([1, 2, 3])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [1, 2, 3]. Invalid number of throws.')
        end
      end

      context 'when given frame has 2 inputs' do
        it 'calculates the score' do
          frame = LastFrame.new([1,9])
          expect(frame.score).to eq(10)
        end
      end
    end
  end
end