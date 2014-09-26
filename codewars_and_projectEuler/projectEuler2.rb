##
#   Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
#     1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#   By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

sequence = [1,2]
first = 1
second = 2
while first + second < 4000000
  sequence.push(first + second)
  temp = first
  first = second
  second = temp+second
end
total = 0
for i in sequence
  if i%2 == 0
    total = total + i
  end
end
puts total