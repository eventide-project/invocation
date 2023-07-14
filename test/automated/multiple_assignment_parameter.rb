require_relative 'automated_init'

context "Multiple Assignment Parameter" do
  invocation = Invocation::Controls::MultipleAssignmentParameter.example(11, 111)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Arguments are Recorded" do
    value = invocation.arguments[:parameters]

    test "Value" do
      assert(value == [11, 111])
    end
  end
end
