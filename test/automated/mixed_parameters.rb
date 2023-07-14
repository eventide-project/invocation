require_relative 'automated_init'

context "Mixed Parameters" do
  blk = proc { }
  invocation = Invocation::Controls::MixedParameters.example(11, 1111, 11111, some_other_parameter: 111, yet_another_parameter: 1111, additional_parameter: 11111, &blk)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Arguments are recorded" do
    context "Positional" do
      value = invocation.arguments[:some_parameter]

      test "Value" do
        assert(value == 11)
      end
    end

    context "Multiple Assignment Positional" do
      value = invocation.arguments[:parameters]

      test "Value" do
        assert(value == [1111, 11111])
      end
    end

    context "Keyword" do
      value = invocation.arguments[:some_other_parameter]

      test "Value" do
        assert(value == 111)
      end
    end

    context "Multiple Assignment Keyword Parameters" do
      value = invocation.arguments[:keyword_parameters]

      test "Value" do
        assert(value == { yet_another_parameter: 1111, additional_parameter: 11111 })
      end
    end

    context "Block" do
      value = invocation.arguments[:block]

      test "Value" do
        assert(value == blk)
      end
    end
  end
end

