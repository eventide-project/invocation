class Invocation
  module Controls
    module MixedParameters
      def self.example(some_parameter, *parameters, some_other_parameter:, **keyword_parameters, &block)
        subject = Example.new
        subject.some_method(some_parameter, *parameters, some_other_parameter: some_other_parameter, **keyword_parameters, &block)
      end

      class Example
        def some_method(some_parameter, *parameters, some_other_parameter:, **keyword_parameters, &block)
          ::Invocation.build(binding)
        end
      end
    end
  end
end
