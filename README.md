# invocation

Extract information about a method's invocation including the method name, parameter names, and parameter values

## Example

``` ruby
class Example
  def some_method(some_parameter, some_other_parameter)
    Invocation.build(binding)
  end
end

subject = Example.new
invocation = subject.some_method(11, 111)

invocation.method_name
# => :some_method

param_1 = invocation.parameters[0]

param_1.name
# => :some_parameter

param_1.value
# => 11

param_2 = invocation.parameters[1]

param_1.name
# => :some_other_parameter

param_1.value
# => 111
```

## All Parameter Types and Combinations

A method signature with positional parameters, named parameters, splat parameters, double splat parameters, and block arguments works no differently than a method signature with simple positional parameters.

``` ruby
def some_method(some_parameter, *parameters, some_other_parameter:, **named_parameters, &blk)
::Invocation.build(binding)
end
```

## The Invocation Data Structure

The `Invocation` data structure captures information about a method invocation, including the method name, the parameter names, and their values.

It has two attributes:
- `method_name`
- `parameters`

The `parameters` attribute is an array of `Invocation::Parameter` structs.

The `Parameter` struct has two attributes:
- `name`
- `value`

## Uses

The Invocation library is used by the [Mimic](https://github.com/eventide-project/mimic) library when a mimic object has method recording activated. When a mimic records an invocation of a method on a mimic, it is recorded as an instance of `Invocation`.

## License

The `invocation` library is released under the [MIT License](https://github.com/eventide-project/invocation/blob/master/MIT-License.txt).
