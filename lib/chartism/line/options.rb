module Chartism
  module Line
    class Options
      extend Chartism::Options

      define_option :points, :showPoint
      define_option :smooth, :lineSmooth
      define_option :area, :showArea
      define_option :line, :showLine
      define_option :full_width, :fullWidth
    end
  end
end
