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
      num.split(delimiter(num)).sum(&:to_i)
    end
  end
end
