# Continuously walks through array comparing index[i] to index[i+1]
# Uses both bubblesort optimisations:
# 1. stops sorting when the last pass made no swaps
# 2. stops at index n-passes each pass (in bubble sort, rightmost n values are final where n = number of completed passes)

def bubble_sort(numbers)
  sorted = false
  last_index = numbers.length-2
  until sorted
    swaps = 0
    0.upto(last_index) do |i|
      if numbers[i] > numbers[i+1]
        numbers[i],numbers[i+1] = numbers[i+1],numbers[i]
        swaps += 1
      end
    end
    sorted = true if swaps == 0 #optimisation 1
    last_index -= 1             #optimisation 2
  end
  numbers
end

# yield to block variation
def bubble_sort_by(input)
  sorted = false
  last_index = input.length-2
  until sorted
    swaps = 0
    0.upto(last_index) do |i|
      if yield(input[i], input[i+1]) < 0
        input[i],input[i+1] = input[i+1],input[i]
        swaps += 1
      end
    end
    sorted = true if swaps == 0
    last_index -= 1
  end
  input
end