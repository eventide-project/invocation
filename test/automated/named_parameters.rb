require_relative 'automated_init'

context "Keyword Parameters" do
  invocation = Invocation::Controls::KeywordParameters.example(some_parameter: 11, some_other_parameter: 111)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Arguments are Recorded" do
    context do
      value = invocation.arguments[:some_parameter]

      test "Value" do
        assert(value == 11)
      end
    end

    context do
      value = invocation.arguments[:some_other_parameter]

      test "Value" do
        assert(value == 111)
      end
    end
  end
end

