class StringCalculator
  def self.add(num)
    return 0 if num.empty?

    a, b = num.split(',')

    return a.to_i if b.nil?

    a.to_i + b.to_i
  end
end
