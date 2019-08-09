class Invocation
  module Controls
    module Invocation
      def self.no_parameters
        subject = Subject::NoParameters.new
        subject.some_method
      end

      def self.positional_parameters(some_parameter, some_other_parameter)
        subject = Subject::PositionalParameters.new
        subject.some_method(some_parameter, some_other_parameter)
      end

      module Subject
        class NoParameters
          def some_method
            ::Invocation.build(binding)
          end
        end

        class PositionalParameters
          def some_method(some_parameter, some_other_parameter)
            ::Invocation.build(binding)
          end
        end
      end
    end
  end
end
