require 'spec_helper'
 
describe Frame do
  let(:frame) { [6,2] }

  describe '#initialize' do
    it 'takes an array and returns a Frame object' do
      frame = Frame.new(frame)
      expect(frame.class).to equal(Frame)
    end
  end

  describe '#strike' do
    context 'when first ball is 10' do
    end

    context 'when first ball is not less than 10' do
    end
  end

  describe '#score' do
    context 'when input is invalid' do
      context 'when there is no input' do
        it 'returns an error' do
        end
      end

      context 'when given frame values are empty' do
        it 'returns an error' do
        end
      end

      context 'when given frame values are non-numeric' do
        it 'returns an error' do
        end
      end

      context 'when given frame values are greater than 10' do
        it 'returns an error' do
        end
      end

      context 'when given frame values are negative' do
        it 'returns an error' do
        end
      end

      context 'when frame is strike and there are 2 values given' do
        it 'returns an error' do
        end
      end

      context 'when frame is not strike and there are only 1 value given' do
        it 'returns an error' do
        end
      end
    end

    context 'when input is valid' do
      it 'calculates the score for the given frame with a strike' do
      end

      it 'calculates the score for the given frame with no strikes' do
      end
    end
  end
end