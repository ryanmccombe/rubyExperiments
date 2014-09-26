def add(a,b)
  a+b
end

def subtract(a,b)
  a-b
end

def sum(arr)
  arr.reduce(0, &:+)
end

def multiply(*args)
  args.reduce(:*)
end

def power(a,b)
  a**b
end

def factorial(n)
  # no standard library method (?)
  n >= 1 ? (1..n).reduce(:*) : 0
end