require_relative 'automated_init'

context "Mixed Parameters" do
  blk = proc { }
  invocation = Invocation::Controls::MixedParameters.example(11, 1111, 11111, some_other_parameter: 111, yet_another_parameter: 1111, additional_parameter: 11111, &blk)

pp invocation

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Parameters are recorded" do
    context "some_parameter" do
      param = invocation.parameters[0]

      test "Name" do
        assert(param.name == :some_parameter)
      end

      test "Value" do
        assert(param.value == 11)
      end
    end

    context "splat parameters" do
      param = invocation.parameters[1]

      test "Name" do
        assert(param.name == :parameters)
      end

      test "Value" do
        assert(param.value == [1111, 11111])
      end
    end

    context "some_other_parameter" do
      param = invocation.parameters[2]

      test "Name" do
        assert(param.name == :some_other_parameter)
      end

      test "Value" do
        assert(param.value == 111)
      end
    end

    context "double splat parameters" do
      param = invocation.parameters[3]

      test "Name" do
        assert(param.name == :named_parameters)
      end

      test "Value" do
        assert(param.value == { yet_another_parameter: 1111, additional_parameter: 11111 })
      end
    end

    context "blk" do
      param = invocation.parameters[4]

      test "Name" do
        assert(param.name == :blk)
      end

      test "Value" do
        assert(param.value == blk)
      end
    end
  end
end

