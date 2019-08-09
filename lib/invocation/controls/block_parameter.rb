class Invocation
  module Controls
    module BlockParameter
      def self.example(&blk)
        subject = Example.new
        subject.some_method(&blk)
      end

      class Example
        def some_method(&blk)
          ::Invocation.build(binding)
        end
      end
    end
  end
end
