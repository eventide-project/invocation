require_relative 'automated_init'

context "No Arguments" do
  invocation = Invocation::Controls::NoParameters.example

  test "No arguments are recorded" do
    assert(invocation.arguments.empty?)
  end
end

