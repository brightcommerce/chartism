module Chartism
  module Pie
    class Options
      extend Chartism::Options

      define_option :donut, :donut
      define_option :width, :donutWidth
      define_option :labels, :showLabel
    end
  end
end
