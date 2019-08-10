class Invocation
  attr_reader :method_name
  attr_reader :parameters

  def initialize(method_name, parameters)
    @method_name = method_name
    @parameters = parameters
  end

  def self.build(bndg)
    instance = bndg.receiver
    method_name = bndg.eval("__method__")

    mthd = instance.method(method_name)

    parameters = mthd.parameters
    parameter_names = parameters.map { |p| p[1] }

    parameter_values = parameter_names.map { |n| bndg.local_variable_get(n) }

    params = {}
    parameter_names.each_with_index do |n, i|
      params[n] = parameter_values[i]
    end

    new(method_name, params)
  end
end
