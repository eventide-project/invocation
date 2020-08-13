class Example
  def self.call
    new.call
  end

  def call
    get_binding('some-req', 'some-opt', 'rest1', 'rest2', keyreq: 'some-keyreq', key: 'some-key', keyrest1: 'some-keyrest1', keyrest2: 'some-keyrest2') do
      'some block'
    end
  end

  def get_binding(req, opt=nil, *rest, keyreq:, key: nil, **keyrest, &block)
    Invocation::Binding.get
  end
end

binding = Example.()

puts <<TEXT

Receiver: #{binding.receiver.inspect}
Method Name: #{binding.method_name.inspect}
eval("__method__"): #{binding&.eval("__method__").inspect}
Local Variables:
  req: #{binding.local_variable_get(:req) || '(none)'}
  opt: #{binding.local_variable_get(:opt) || '(none)'}
  rest: #{binding.local_variable_get(:rest) || '(none)'}
  keyreq: #{binding.local_variable_get(:keyreq) || '(none)'}
  key: #{binding.local_variable_get(:key) || '(none)'}
  keyrest: #{binding.local_variable_get(:keyrest) || '(none)'}
  block: #{binding.local_variable_get(:block) || '(none)'}

TEXT
