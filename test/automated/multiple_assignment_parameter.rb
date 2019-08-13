require_relative 'automated_init'

context "Splat Parameter" do
  invocation = Invocation::Controls::MultipleAssignmentParameter.example(11, 111)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Parameters are recorded" do
    context "parameters" do
      value = invocation.parameters[:parameters]

      test "Value" do
        assert(value == [11, 111])
      end
    end
  end
end
