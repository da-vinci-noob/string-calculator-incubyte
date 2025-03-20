class StringCalculator
  class << self
    def add(num)
      return 0 if num.empty?

      nums = num.split(extract_delimiter(num))
      validate_negatives(nums)
      nums = ignore_numbers(nums)
      add_multiple(nums)
    end

    def extract_delimiter(num)
      return default_delimiter unless num.start_with?('//')

      delimiter = num.match(%r{//(.+)\n})[1]
      Regexp.new(Regexp.escape(delimiter).chars.join('|'))
    end

    def default_delimiter
      /,|\n/
    end

    def add_multiple(nums)
      nums.sum(&:to_i)
    end

    def validate_negatives(nums)
      negatives = nums.select { |num| num.to_i.negative? }
      return unless negatives.any?

      raise ArgumentError, "Negative numbers are not allowed: #{negatives}"
    end

    # Currently, ignoring numbers greater than 1000
    def ignore_numbers(nums)
      nums.reject { |num| num.to_i > 1000 }
    end
  end
end
