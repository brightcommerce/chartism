require 'docile'

module Chartism
  class Pie
    def options &block
      @options = Docile.dsl_eval(Pie::Options.new, &block).options if block
      @options
    end

    def labels value=nil, &block
      @labels = ->{value} unless value.nil?
      @labels = block if block
      @labels
    end

    def series value=nil, &block
      @series = ->{value} unless value.nil?
      @series = block if block
      @series
    end

    def data
      {
        labels: labels.call,
        series: series.call
      }
    end
  end
end
