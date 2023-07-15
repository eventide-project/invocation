require_relative 'automated_init'

context "Mixed Parameters" do
  control_block = proc { }

  invocation = Invocation::Controls::MixedParameters.example(
    :some_arg,
    :some_optional_arg,
    :some_multiple_assignment_arg,
    :some_other_multiple_assignment_arg,
    some_keyword_parameter: :some_keyword_arg,
    some_optional_keyword_parameter: :some_optional_keyword_arg,
    some_multiple_assignment_keyword_parameter: :some_multiple_assignment_keyword_arg,
    some_other_multiple_assignment_keyword_parameter: :some_other_multiple_assignment_keyword_arg,
    &control_block
  )

  arguments = invocation.arguments

  detail "Invocation: #{invocation.pretty_inspect}"

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Arguments" do
    context "Positional" do
      value = arguments[:some_parameter]

      test "Value" do
        assert(value == :some_arg)
      end
    end

    context "Optional Positional" do
      value = arguments[:some_optional_parameter]

      test "Value" do
        assert(value == :some_optional_arg)
      end
    end

    context "Multiple Assignment" do
      value = invocation.arguments[:some_multiple_assignment_parameter]

      test "Value" do
        assert(value == [:some_multiple_assignment_arg, :some_other_multiple_assignment_arg])
      end
    end

    context "Keyword" do
      value = invocation.arguments[:some_keyword_parameter]

      test "Value" do
        assert(value == :some_keyword_arg)
      end
    end

    context "Optional Keyword" do
      value = invocation.arguments[:some_optional_keyword_parameter]

      test "Value" do
        assert(value == :some_optional_keyword_arg)
      end
    end

    context "Multiple Assignment Keyword Parameters" do
      value = invocation.arguments[:some_multiple_assignment_keyword_parameter]

      test "Value" do
        assert(value == {
          some_multiple_assignment_keyword_parameter: :some_multiple_assignment_keyword_arg,
          some_other_multiple_assignment_keyword_parameter: :some_other_multiple_assignment_keyword_arg
         })
      end
    end

    context "Block" do
      value = invocation.arguments[:some_block]

      test "Value" do
        assert(value == control_block)
      end
    end
  end
end

