require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:todo) { skip 'TODO' }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(described_class.add('')).to eq(0)
    end

    context 'when single number' do
      it 'returns the same number' do
        todo
      end
    end

    context 'when 2 numbers' do
      it 'returns the sum of 2 numbers' do
        todo
      end
    end

    context 'when multiple numbers' do
      it 'returns the sum of multiple numbers' do
        todo
      end
    end

    context 'when new line delimiter' do
      it 'returns the sum of numbers separated by new line' do
        todo
      end
    end

    context 'when new line with comma delimiter' do
      it 'returns the sum of numbers separated by new line and comma' do
        todo
      end
    end

    context 'when custom delimiter' do
      it 'returns the sum of numbers separated by custom delimiter' do
        todo
      end
    end

    context 'when negative numbers' do
      it 'raises an error if negative numbers are present' do
        todo
      end

      it 'includes the negative numbers in the error message' do
        todo
      end
    end

    context 'when ignore numbers greater than 1000' do
      it 'returns the sum of numbers greater than 1000' do
        todo
      end
    end

    context 'when multiple custom delimiters' do
      it 'returns the sum of numbers separated by multiple custom delimiters' do
        todo
      end
    end
  end
end
