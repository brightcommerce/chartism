module Chartism
  module Chart
    def define_option method_name
      define_method method_name do
        value = self.class.send(method_name)
        if value.is_a?(Proc)
          instance_eval &value
        else
          value
        end
      end
    end

    def define_array_option method_name
      define_method method_name do
        values = Array(self.class.send(method_name))
        values.map do |value|
          if value.is_a?(Proc)
            instance_eval &value
          else
            value
          end
        end
      end
    end

    module ClassMethods
      def define_option method_name
        define_method method_name do |value=nil, &block|
          instance_variable_set "@#{method_name}", value unless value.nil?
          instance_variable_set "@#{method_name}", block if block
          instance_variable_get "@#{method_name}"
        end
      end

      def define_block_option method_name, default=nil
        define_method method_name do |&block|
          instance_variable_set "@#{method_name}", block if block
          instance_variable_get("@#{method_name}") || default
        end
      end

      def define_array_option method_name
        define_method method_name do |value=nil, &block|
          array = instance_variable_get "@#{method_name}"
          array = instance_variable_set("@#{method_name}", []) unless array

          array << value unless value.nil?
          array << block if block
          array
        end
      end
    end
  end
end
