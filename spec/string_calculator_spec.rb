require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:todo) { skip 'TODO' }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(described_class.add('')).to eq(0)
    end

    context 'when single number' do
      it 'returns 1 with "1"' do
        expect(described_class.add('1')).to eq(1)
      end

      it 'returns 2 with "2"' do
        expect(described_class.add('2')).to eq(2)
      end
    end

    context 'when 2 numbers' do
      it 'returns the sum of 1 and 2' do
        expect(described_class.add('1,2')).to eq(3)
      end

      it 'returns the sum of 3 and 4' do
        expect(described_class.add('3,4')).to eq(7)
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
