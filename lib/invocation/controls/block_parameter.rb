class Invocation
  module Controls
    module BlockParameter
      def self.example(&block)
        subject = Example.new
        subject.some_method(&block)
      end

      class Example
        def some_method(&block)
          ::Invocation.build(binding)
        end
      end
    end
  end
end
