# String Calculator

A simple string calculator that handles various input formats and delimiters.

## Features

- Handles empty strings (returns 0)
- Processes single number inputs
- Sums multiple numbers separated by commas
- Supports newline characters as delimiters
- Allows custom delimiters using `//[delimiter]\n` format
- Throws exceptions for negative numbers, listing all negatives
- Ignores numbers greater than 1000

## Usage

```ruby
# Basic usage
StringCalculator.add("1,2,3") # => 6

# Custom delimiters
StringCalculator.add("//;\n1;2;3") # => 6

# Negative numbers
StringCalculator.add("1,-2,3") # => raises "Negatives not allowed: -2"
```
