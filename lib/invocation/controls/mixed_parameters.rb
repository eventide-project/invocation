class Invocation
  module Controls
    module MixedParameters
      def self.example(some_parameter, some_other_parameter:)
        subject = Example.new
        subject.some_method(some_parameter, some_other_parameter: some_other_parameter)
      end

      class Example
        def some_method(some_parameter, some_other_parameter:)
          ::Invocation.build(binding)
        end
      end
    end
  end
end
