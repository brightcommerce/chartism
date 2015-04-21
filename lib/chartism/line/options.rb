module Chartism
  module Line
    class Options
      def initialize
        @options = {
          showPoint: true,
          lineSmooth: true,
          showArea: false
        }
      end

      def points value=nil, &block
        @options[:showPoint] = value unless value.nil?
        @options[:showPoint] = instance_eval(&block) if block_given?
      end

      def smooth value=nil, &block
        @options[:lineSmooth] = value unless value.nil?
        @options[:lineSmooth] = instance_eval(&block) if block_given?
      end

      def area value=nil, &block
        @options[:showArea] = value unless value.nil?
        @options[:showArea] = instance_eval(&block) if block_given?
      end

      def options
        @options
      end
    end
  end
end
