class Invocation
  module Controls
    module NoParameters
      def self.example
        subject = Example.new
        subject.some_method
      end

      class Example
        def some_method
          ::Invocation.build(binding)
        end
      end
    end
  end
end
