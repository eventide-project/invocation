require_relative 'automated_init'

context "Ignored Parameters" do
  control_block = proc { }

  invocation = Invocation::Controls::IgnoredParameters.example(
    :some_ignored_arg,
    :some_other_ignored_arg,
    some_ignored_keyword_parameter: :some_ignored_keyword_arg,
    some_other_ignored_keyword_parameter: :some_other_ignored_keyword_arg,
    &control_block
  )

  arguments = invocation.arguments

  detail "Invocation: #{invocation.pretty_inspect}"

  context "Arguments" do
    context "Ignored" do
      value = invocation.arguments[:*]

      test "Value" do
        assert(value == [:some_ignored_arg, :some_other_ignored_arg])
      end
    end

    context "Ignored Keyword Parameters" do
      value = invocation.arguments[:**]

      test "Value" do
        assert(value == {
          some_ignored_keyword_parameter: :some_ignored_keyword_arg,
          some_other_ignored_keyword_parameter: :some_other_ignored_keyword_arg
         })
      end
    end

    context "Ignored Block" do
      value = invocation.arguments[:&]

      test "Value" do
        assert(value == control_block)
      end
    end
  end
end

