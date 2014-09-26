def add(*nums)
  nums.reduce(:+)
end

def subtract(*nums)
  nums.reduce(:-)
end

def calculate(*args)
  options = args[-1].is_a?(Hash) ? args.pop : {}
  return add(*args) if options[:add] || options.empty?
  return subtract(*args) if options[:subtract]
end