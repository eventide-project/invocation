class Invocation
  module Controls
    module MixedParameters
      def self.example(some_parameter, *parameters, some_other_parameter:, **named_parameters, &blk)
        subject = Example.new
        subject.some_method(some_parameter, *parameters, some_other_parameter: some_other_parameter, **named_parameters, &blk)
      end

      class Example
        def some_method(some_parameter, *parameters, some_other_parameter:, **named_parameters, &blk)
          ::Invocation.build(binding)
        end
      end
    end
  end
end
