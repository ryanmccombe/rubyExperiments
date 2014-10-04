def next_number(n, val = 1, prev = 0)
  return prev if n == 0
  return val if n == 1
  next_number(n - 1, val+prev, val)
end

def fibonacci_list_to(num)
  list = []
  0.upto(num) do |i|
    list << next_number(i)
  end
  list
end

#########################
# O(2^n) - Super Inefficient - 1 minute to calculate n=40

def next_number_inefficient(n)
  return 0 if n == 0
  return 1 if n == 1
  next_number_inefficient(n-1) + next_number_inefficient(n-2)
end

def fibonacci_list_to_inefficient(num)
  list = []
  0.upto(num) do |i|
    list << next_number_inefficient(i)
  end
  list
end


require 'benchmark'
n = 40
Benchmark.bm do |x|
  x.report('efficient') {fibonacci_list_to(n)}
  x.report('inefficient') {fibonacci_list_to_inefficient(n)}
end

#                   user     system      total        real
# efficient     0.000000   0.000000   0.000000 (  0.000000)
# inefficient  69.515000   0.000000  69.515000 ( 69.543383)