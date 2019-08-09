require_relative 'automated_init'

context "Splat Parameter" do
  invocation = Invocation::Controls::SplatParameter.example(11, 111)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Parameters are recorded" do
    context "The rest" do
      param = invocation.parameters[0]

      test "Name" do
        assert(param.name == :parameters)
      end

      test "Value" do
        assert(param.value == [11, 111])
      end
    end
  end
end

