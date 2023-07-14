require_relative 'automated_init'

context "Multiple Assignment Keyword Parameter" do
  invocation = Invocation::Controls::MultipleAssignmentKeywordParameter.example(some_parameter: 11, some_other_parameter: 111)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Argument is recorded" do
    value = invocation.arguments[:parameters]

    test "Value" do
      assert(value == { some_parameter: 11, some_other_parameter: 111 })
    end
  end
end
