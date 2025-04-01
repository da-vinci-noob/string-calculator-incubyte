class StringCalculator
  class << self
    # Constants for Statics
    MAX_NUMBER = 1000
    DEFAULT_DELIMITER = /,|\n/

    def add(input)
      return 0 if input.empty?

      delimiter = extract_delimiter(input)
      numbers_array = split_numbers(input, delimiter)
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
      negatives = numbers_array.select { |num| num.to_i.negative? }
      return unless negatives.any?

      raise ArgumentError, "Negative numbers are not allowed: #{negatives}"
    end

    # Filter out numbers greater than 1000
    def filtered_numbers(numbers_array, delimiter)
      numbers_array.reject { |num| num.to_i > MAX_NUMBER }
    end

    def split_numbers(input, delimiter)
      return input.split(delimiter) if delimiter == DEFAULT_DELIMITER

      # Find the index of first \n after custom delimiters
      idx = input.index("\n")
      # Then Split the rest of the string based on delimiter
      input[idx + 1..].split(delimiter)
    end

    # Calculate the sum of the numbers
    def calculation(delimiter, numbers_array)
      # puts delimiter
      if delimiter == '*'
        multiplication_of_num(numbers_array, delimiter)
      elsif delimiter == 'o'
        odd_number_sum(numbers_array, delimiter)
      else
        filtered_numbers(numbers_array, delimiter).sum(&:to_i)
      end
    end

    def multiplication_of_num(numbers_array, delimiter)
      num = 1
      filtered_numbers(numbers_array, delimiter).each do |n|
        num *= n.to_i
      end
      num
    end

    def odd_number_sum(numbers_array, delimiter)
      num = 0
      filtered_numbers(numbers_array, delimiter).each do |n|
        num += n.to_i if n.to_i.odd?
      end
      num
    end
  end
end
