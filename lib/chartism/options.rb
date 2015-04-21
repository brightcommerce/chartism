module Chartism
  module Options
    def define_option method_name, option_name
      define_method method_name do |value=nil, &block|
        @options[option_name] = value unless value.nil?
        @options[option_name] = instance_eval(&block) if block_given?
      end
    end
  end
end
