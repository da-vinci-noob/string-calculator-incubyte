class StringCalculator
  class << self
    def add(num)
      return 0 if num.empty?

      a, b = num.split(',')

      return a.to_i if b.nil?

      two_numbers(a, b)
    end

    def two_numbers(num_a, num_b)
      num_a.to_i + num_b.to_i
    end
  end
end
