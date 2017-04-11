require_relative '../spec_helper'
 
describe Frame do
  let(:frame_value) { [6,2] }

  describe '#initialize' do
    it 'takes an array and returns a Frame object' do
      frame = Frame.new(frame_value)
      expect(frame.class).to equal(Frame)
    end
  end

  describe '#strike' do
    context 'when first ball is 10' do
      it 'returns true' do
        frame = Frame.new([10])
        expect(frame.strike?).to equal(true)
      end
    end

    context 'when first ball is less than 10' do
      it 'returns false' do
        frame = Frame.new(frame_value)
        expect(frame.strike?).to equal(false)
      end
    end
  end

  describe '#score' do
    describe 'input is invalid' do
      context 'when there is no input' do
        it 'raises an error' do
          frame = Frame.new(nil)
          expect{ frame.score }.to raise_error(ArgumentError, 
            "Invalid Input: nil. Frames can't be blank.")
        end
      end

      context 'when given frame values are empty' do
        it 'raises an error' do
          frame = Frame.new([])
          expect{ frame.score }.to raise_error(ArgumentError, 
            "Invalid Input: []. Frames can't be blank.")
        end
      end

      context 'when given frame values are non-numeric' do
        it 'raises an error' do
          frame = Frame.new(['a','b'])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: ["a", "b"]. Frames should be a number between 0 and 10.')
        end
      end

      context 'when given frame values are greater than 10' do
        it 'raises an error' do
          frame = Frame.new([11,12])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [11, 12]. Frames should be a number between 0 and 10.')
        end
      end

      context 'when given frame values adds up to greater than 10' do
        it 'raises an error' do
          frame = Frame.new([8,6])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [8, 6]. Frame scores should have a maximum total of 10.')
        end
      end

      context 'when given frame values are negative' do
        it 'raises an error' do
          frame = Frame.new([-1,-2])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [-1, -2]. Frames should be a number between 0 and 10.')
        end
      end

      context 'when frame is strike and there are 2 values given' do
        it 'raises an error' do
          frame = Frame.new([10,2])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [10, 2]. Invalid number of throws.')
        end
      end

      context 'when frame is not strike and there is only 1 value given' do
        it 'raises an error' do
          frame = Frame.new([2])
          expect{ frame.score }.to raise_error(ArgumentError, 
            'Invalid Input: [2]. Invalid number of throws.')
        end
      end
    end

    describe 'input is valid' do
      it 'calculates the score for the given strike frame' do
        frame = Frame.new([10])
        expect(frame.score).to eq(10)
      end

      it 'calculates the score for the given spare frame' do
        frame = Frame.new([9,1])
        expect(frame.score).to eq(10)
      end
    end
  end
end