module Enumerable
  def my_each
    return self unless block_given?
    for i in 0..length-1
      yield(self[i])
    end
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0..length-1
      yield(self[i],i)
    end
  end

  def my_select
    return self unless block_given?
    result = []
    for i in 0..self.length-1
      result << self[i] if yield(self[i])
    end
    result
  end

  def my_all?
      my_each { |i| return false unless i } unless block_given?
      my_each { |i| return false unless yield(i)} if block_given?
      true
  end

  def my_any?
    for i in self
      return true if self[i] unless block_given?
      return true if yield(self[i]) if block_given?
    end
  false
  end

  def my_none?
    for i in 0..self.length-1
      return false if self[i] unless block_given?
      return false if yield(self[i]) if block_given?
    end
    true
  end

  def my_count(search = false)
    if search

    elsif block_given?
      self.my_select
    else
      self.length
    end
  end

  def my_map

  end

  def my_inject

  end
end

# puts [1,2,3,4,5].my_each{ |n| n*2 }