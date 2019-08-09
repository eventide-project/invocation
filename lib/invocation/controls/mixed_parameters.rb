# class Invocation
#   module Controls
#     module MixedParameters
#       def self.example(some_parameter, some_other_parameter:, *parameters, &blk)
#         subject = Example.new
#         subject.some_method(some_parameter, some_other_parameter: some_other_parameter, *parameters, &blk)
#       end

#       class Example
#         def some_method(some_parameter, some_other_parameter:, *parameters, &blk)
#           ::Invocation.build(binding)
#         end
#       end
#     end
#   end
# end

class Invocation
  module Controls
    module MixedParameters
      def self.example(some_parameter, *parameters, some_other_parameter:, &blk)
        subject = Example.new
        subject.some_method(some_parameter, *parameters, some_other_parameter: some_other_parameter, &blk)
      end

      class Example
        def some_method(some_parameter, *parameters, some_other_parameter:, &blk)
          ::Invocation.build(binding)
        end
      end
    end
  end
end
