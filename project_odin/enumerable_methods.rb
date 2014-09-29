module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
    self
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0..length-1
      yield(self[i],i)
    end
    self
  end

  def my_select
    return self unless block_given?
    result = []
    for i in self
      result << i if yield(i)
    end
    result
  end

  def my_all?
    my_each { |i| return false unless i } unless block_given?
    my_each { |i| return false unless yield(i)} if block_given?
    true
  end

  def my_any?
    my_each { |i| return true if i } unless block_given?
    my_each { |i| return true if yield(i)} if block_given?
    false
  end

  def my_none?
    my_any? { |i| return false if yield(i) }
    true
  end


  def my_count(search = false)
    count = 0
    if search
      my_each { |word| count += 1 if word == search}
    elsif block_given?
      my_select { |i| count += 1 if yield(i) }
    else
      return length
    end
    count
  end

  def my_map
    return self unless block_given?
    result = []
    for i in self
      result << yield(i)
    end
    result
  end

  def my_inject(init = false)
    if !init
      sum = 0 if first.is_a? Numeric
      sum = '' if first.is_a? String
    else
      sum = init
    end
    my_each { |i| sum = yield(sum,i) }
    sum
  end

end