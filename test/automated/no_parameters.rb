require_relative 'automated_init'

context "No Parameters" do
  invocation = Invocation::Controls::NoParameters.example

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  test "No parameters are recorded" do
    assert(invocation.parameters.empty?)
  end
end

