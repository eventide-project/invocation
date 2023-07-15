class Invocation
  module Controls
    module MixedParameters
      def self.example(...)
        instance = Example.new()
        instance.some_method(...)
      end

      class Example
        def some_method(
          some_parameter,
          some_optional_parameter=nil,
          *some_multiple_assignment_parameter,
          some_keyword_parameter:,
          some_optional_keyword_parameter: nil,
          **some_multiple_assignment_keyword_parameter,
          &some_block
        )
          ::Invocation.build(binding)
        end
      end
    end
  end
end
