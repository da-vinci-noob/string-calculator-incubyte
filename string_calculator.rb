class StringCalculator
  class << self
    def add(num)
      return 0 if num.empty?

      add_multiple(num)
    end

    def add_multiple(num)
      num.split(',').map(&:to_i).sum
    end
  end
end
