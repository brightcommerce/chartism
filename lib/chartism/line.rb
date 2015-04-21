require 'docile'

module Chartism
  module Line
    extend Chart

    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      extend Chart::ClassMethods

      define_option :labels
      define_array_option :series
      define_block_option :options, ->{}
    end

    define_option :labels
    define_array_option :series

    def data
      {
        labels: labels,
        series: series
      }
    end

    def options
      Docile.dsl_eval(Line::Options.new, &self.class.options).options
    end
  end
end
