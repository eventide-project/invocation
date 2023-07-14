require_relative 'automated_init'

context "Block Parameter" do
  blk = proc { }
  invocation = Invocation::Controls::BlockParameter.example(&blk)

  test "Method name is recorded" do
    assert(invocation.method_name == :some_method)
  end

  context "Argument is recorded" do
    value = invocation.arguments[:block]

    test "Value" do
      assert(value == blk)
    end
  end
end
