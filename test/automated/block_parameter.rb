require_relative 'automated_init'

context "Named Parameters" do
  blk = proc { }
  invocation = Invocation::Controls::BlockParameter.example(&blk)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Parameter is recorded" do
    context "blk" do
      param = invocation.parameters[0]

      test "Name" do
        assert(param.name == :blk)
      end

      test "Value" do
        assert(param.value == blk)
      end
    end
  end
end
