require 'docile'

module Chartism
  class Line
    def initialize
      @series = []
    end

    def options &block
      @options = Docile.dsl_eval(Line::Options.new, &block).options if block
      @options
    end

    def labels value=nil, &block
      @labels = ->{value} unless value.nil?
      @labels = block if block
      @labels
    end

    def series value=nil, &block
      @series << ->{value} unless value.nil?
      @series << block if block
      @series
    end

    def data
      {
        labels: labels.call,
        series: series.map(&:call)
      }
    end
  end
end
