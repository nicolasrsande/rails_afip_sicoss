module Fixy
  module Formatter
    module NumericFloatL
      def format_numeric_float_l(input, byte_width)
        input = format('%.2f', input).to_s.gsub('.', ',')
        raise ArgumentError, "Not enough byte width (input: #{input}, byte width: #{byte_width})" if input.bytesize > byte_width
        String.new(input).ljust(byte_width, ' ')
      end
    end
  end
end