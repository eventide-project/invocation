require_relative 'automated_init'

context "Positional Parameters" do
  invocation = Invocation::Controls::PositionalParameters.example(11, 111)

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

    context "some_other_parameter" do
      value = invocation.parameters[:some_other_parameter]

      test "Value" do
        assert(value == 111)
      end
    end
  end
end

