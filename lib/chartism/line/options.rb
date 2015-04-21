module Chartism
  module Line
    class Options
      extend Chartism::Options

      define_option :points, :showPoint
      define_option :smooth, :lineSmooth
      define_option :area, :showArea
      define_option :line, :showLine

      attr_reader :options

      def initialize
        @options = {
          showPoint: true,
          lineSmooth: true,
          showArea: false
        }
      end
    end
  end
end
