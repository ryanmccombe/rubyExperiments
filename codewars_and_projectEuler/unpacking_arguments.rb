##
# You must create a function, spread, that takes a function and a list of arguments to be applied to that function.
# You must make this function return the result of calling the given function/lambda with the given arguments.

def spread(func, args)
  func.call(*args)
end
