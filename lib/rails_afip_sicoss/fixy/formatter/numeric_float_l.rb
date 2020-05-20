module Fixy
  module Formatter
    module NumericFloatL
      def format_numeric_float_l(input, length)
        input = format('%.2f', input).to_s.gsub('.', ',')
        raise ArgumentError, "Invalid Input (only digits are accepted)" unless input =~ /^\d+$/
        raise ArgumentError, "Not enough length (input: #{input}, length: #{length})" if input.length > length
        input.ljust(length, ' ')
      end
    end
  end
end