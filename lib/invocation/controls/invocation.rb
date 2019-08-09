class Invocation
  module Controls
    module Invocation
      def self.no_parameters
        subject = Subject::NoParameters.new
        subject.some_method
      end

      module Subject
        class NoParameters
          def some_method
            ::Invocation.build(binding)
          end
        end
      end
    end
  end
end
