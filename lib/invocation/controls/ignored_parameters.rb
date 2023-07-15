class Invocation
  module Controls
    module IgnoredParameters
      def self.example(...)
        instance = Example.new()
        instance.some_method(...)
      end

      class Example
        def some_method(
          *,
          **,
          &
        )
          ::Invocation.build(binding)
        end
      end
    end
  end
end
