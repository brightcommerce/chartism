module Chartism
  module Options
    def self.extended base
      base.include InstanceMethods
    end

    module InstanceMethods
      attr_reader :options
    end

    def define_option method_name, option_name
      define_method method_name do |value=nil, &block|
        @options ||= {}
        @options[option_name] = value unless value.nil?
        @options[option_name] = instance_eval(&block) if block
      end
    end
  end
end
