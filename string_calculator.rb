class StringCalculator
  class << self
    def add(num)
      return 0 if num.empty?

      add_multiple(num)
    end

    def delimiter(num)
      /,|\n/
    end

    def add_multiple(num)
      validate_negatives(num)
      num.split(delimiter(num)).sum(&:to_i)
    end

    def validate_negatives(num)
      return unless num.include?('-')

      raise ArgumentError, 'Negative numbers are not allowed'
    end
  end
end
