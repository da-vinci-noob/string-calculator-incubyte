class StringCalculator
  class << self
    def add(input)
      return 0 if input.empty?

      numbers_array = input.split(extract_delimiter(input))
      validate_negatives(numbers_array)
      filtered_numbers(numbers_array).sum(&:to_i)
    end

    # Extract delimiter from the string between // and \n
    # If no delimiter is specified, using default delimiter
    def extract_delimiter(input)
      return default_delimiter unless input.start_with?('//')

      delimiter = input.match(%r{//(.+)\n})[1]
      Regexp.new(Regexp.escape(delimiter).chars.join('|'))
    end

    # Default delimiter is comma or new line
    def default_delimiter
      /,|\n/
    end

    # Validate that there are no negative numbers
    def validate_negatives(numbers_array)
      negatives = numbers_array.select { |num| num.to_i.negative? }
      return unless negatives.any?

      raise ArgumentError, "Negative numbers are not allowed: #{negatives}"
    end

    # Filter out numbers greater than 1000
    def filtered_numbers(numbers_array)
      numbers_array.reject { |num| num.to_i > 1000 }
    end
  end
end
