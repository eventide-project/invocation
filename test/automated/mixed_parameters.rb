require_relative 'automated_init'

context "Mixed Parameters" do
  blk = proc { }
  invocation = Invocation::Controls::MixedParameters.example(11, 1111, 11111, some_other_parameter: 111, yet_another_parameter: 1111, additional_parameter: 11111, &blk)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Parameters are recorded" do
    context "some_parameter" do
      value = invocation.parameters[:some_parameter]

      test "Value" do
        assert(value == 11)
      end
    end

    context "splat parameters" do
      value = invocation.parameters[:parameters]

      test "Value" do
        assert(value == [1111, 11111])
      end
    end

    context "some_other_parameter" do
      value = invocation.parameters[:some_other_parameter]

      test "Value" do
        assert(value == 111)
      end
    end

    context "double splat parameters" do
      value = invocation.parameters[:named_parameters]

      test "Value" do
        assert(value == { yet_another_parameter: 1111, additional_parameter: 11111 })
      end
    end

    context "blk" do
      value = invocation.parameters[:blk]

      test "Value" do
        assert(value == blk)
      end
    end
  end
end

