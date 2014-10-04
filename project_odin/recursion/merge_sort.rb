$branch = 1
$debug = true
def merge_sort(list)

  if $debug
    puts "Call #{$branch} - Splitting #{list}" if list.length > 1
    puts "Call #{$branch} - Sending #{list}" if list.length == 1
    $branch += 1
  end

  return list if list.length == 1
  a = list[0, list.length / 2]
  b = list[list.length / 2, list.size]
  merge(merge_sort(a), merge_sort(b))
end

def merge(a, b)

  if $debug
    puts "Merging #{a} + #{b}"
  end

  sorted = []
  until a.empty? || b.empty?
    if a[0] <= b[0]
      sorted << a.shift
    else
      sorted << b.shift
    end
  end
  sorted.concat(a).concat(b)
end

list = []
50.downto(1) do |i|
  list << i
end
list.shuffle!
puts merge_sort(list).inspect