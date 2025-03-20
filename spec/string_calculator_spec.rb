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
      it 'returns the sum of "1,2,3"' do
        expect(described_class.add('1,2,3')).to eq(6)
      end

      it 'returns the sum of "1,2,3,4"' do
        expect(described_class.add('1,2,3,4')).to eq(10)
      end
    end

    context 'when new line delimiter' do
      it 'returns the sum of 1 and 2' do
        expect(described_class.add("1\n2")).to eq(3)
      end

      it 'returns the sum of 6 and 4' do
        expect(described_class.add("6\n4")).to eq(10)
      end
    end

    context 'when new line with comma delimiter' do
      it 'returns the sum of 1, 2 and 3' do
        expect(described_class.add("1\n2,3")).to eq(6)
      end

      it 'returns the sum of 2, 4 and 6' do
        expect(described_class.add("2\n4,6")).to eq(12)
      end
    end

    context 'when negative numbers' do
      it 'raises an error if negative numbers are present' do
        expect { described_class.add('-1,2') }
          .to raise_error(ArgumentError)
      end

      it 'includes the negative numbers in the error message' do
        expect { described_class.add('-1,2,-3') }
          .to raise_error(ArgumentError, 'Negative numbers are not allowed: ["-1", "-3"]')
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
