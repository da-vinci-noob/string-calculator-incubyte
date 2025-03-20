class StringCalculator
  class << self
    def add(num)
      return 0 if num.empty?

      nums = num.split(delimiter)
      validate_negatives(nums)
      add_multiple(nums)
    end

    def delimiter
      /,|\n/
    end

    def add_multiple(nums)
      nums.sum(&:to_i)
    end

    def validate_negatives(nums)
      return unless nums.any? { |num| num.to_i.negative? }

      raise ArgumentError, 'Negative numbers are not allowed'
    end
  end
end
