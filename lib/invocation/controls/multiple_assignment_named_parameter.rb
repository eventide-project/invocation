class Invocation
  module Controls
    module MultipleAssignmentNamedParameter
      def self.example(**parameters)
        subject = Example.new
        subject.some_method(**parameters)
      end

      class Example
        def some_method(**parameters)
          ::Invocation.build(binding)
        end
      end
    end
  end
end
