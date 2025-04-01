class StringCalculator
  class << self
    # Constants for Statics
    MAX_NUMBER = 1000
    DEFAULT_DELIMITER = /,|\n/

    def add(input)
      return 0 if input.empty?

      delimiter = extract_delimiter(input)
      numbers_array = parse_numbers(input, delimiter)
      validate_negatives(numbers_array)
      calculation(delimiter, numbers_array)
    end

    # Extract delimiter from the string between // and \n
    # If no delimiter is specified, using default delimiter
    def extract_delimiter(input)
      return DEFAULT_DELIMITER unless input.start_with?('//')

      delimiter = input.match(%r{//(.+)\n})[1]
      return delimiter if delimiter.size == 1

      Regexp.new(
        delimiter.chars.map { |c| Regexp.escape(c) }
        .join('|')
      )
    end

    # Validate that there are no negative numbers
    def validate_negatives(numbers_array)
      negatives = numbers_array.select(&:negative?)
      return unless negatives.any?

      raise ArgumentError, "Negative numbers are not allowed: #{negatives}"
    end

    # Filter out numbers greater than 1000
    def filtered_numbers(numbers_array)
      numbers_array.reject { |num| num > MAX_NUMBER }
    end

    def parse_numbers(input, delimiter)
      numbers = if delimiter == DEFAULT_DELIMITER
        input.split(delimiter)
      else
        # Find the index of first \n after custom delimiters
        idx = input.index("\n")
        # Then Split the rest of the string based on delimiter
        input[idx + 1..].split(delimiter)
      end
      numbers.map(&:to_i)
    end

    # Calculate the sum of the numbers
    def calculation(delimiter, numbers_array)
      if delimiter == '*'
        multiplication_of_num(numbers_array)
      elsif delimiter == 'o'
        odd_number_sum(numbers_array)
      else
        filtered_numbers(numbers_array).sum
      end
    end

    def multiplication_of_num(numbers_array)
      filtered_numbers(numbers_array).inject(1) { |res, n| res * n }
    end

    def odd_number_sum(numbers_array)
      filtered_numbers(numbers_array).inject(0) { |res, n| n.odd? ? res + n : res }
    end
  end
end
