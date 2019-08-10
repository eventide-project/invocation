require_relative 'automated_init'

context "Named Parameters" do
  blk = proc { }
  invocation = Invocation::Controls::BlockParameter.example(&blk)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Parameter is recorded" do
    context "blk" do
      value = invocation.parameters[:blk]

      test "Value" do
        assert(value == blk)
      end
    end
  end
end
