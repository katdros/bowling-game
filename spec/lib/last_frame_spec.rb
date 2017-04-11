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

      context 'when second throw is not a strike' do
        context 'when given frame values adds up to greater than 20' do
          it 'raises an error' do
            frame = LastFrame.new([10,8,6])
            expect{ frame.score }.to raise_error(ArgumentError, 
              'Invalid Input: [10, 8, 6]. Frame scores should have a maximum total of 20.')
          end
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

      context 'when given frame values adds up to greater than 10' do
        it 'raises an error' do
          frame = LastFrame.new([8,6])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [8, 6]. Frame scores should have a maximum total of 10.')
        end
      end
    end
  end
end