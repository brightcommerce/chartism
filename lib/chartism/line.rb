require 'docile'
require 'chartism/line/options'

module Chartism
  module Line
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def labels value=nil, &block
        if block_given?
          @labels = block
        elsif value
          @labels = value
        end

        @labels
      end

      def series value=nil, &block
        @series ||= []

        if block_given?
          @series << block
        elsif value
          @series << value
        end

        @series
      end

      def options &block
        @options = block if block_given?
        @options
      end
    end

    def labels
      if self.class.labels.is_a?(Proc)
        instance_eval(&self.class.labels)
      else
        self.class.labels
      end
    end

    def series
      Array(self.class.series).map do |serie|
        if serie.is_a?(Proc)
          instance_eval(&serie)
        else
          serie
        end
      end
    end

    def data
      {
        labels: labels,
        series: series
      }
    end

    def options
      Docile.dsl_eval(Options.new, &(self.class.options || ->{}) ).options
    end
  end
end
