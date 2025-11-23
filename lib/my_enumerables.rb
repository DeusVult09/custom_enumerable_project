module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
    self
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr << elem if yield(elem)
    end
    arr
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem) 
    end
    true
  end

  def my_count
    i_count = 0
    if block_given?
      self.my_each  { |elem| i_count += 1 if yield(elem) }
    else
      self.my_each  { |elem| i_count += 1 }
    end
    i_count
  end

  def my_map
    arr = []
    self.my_each do |elem|
      arr << yield(elem)
    end
    arr
  end

  def my_inject(init_value)
    acc = init_value
    self.my_each do |elem| 
      acc = yield(acc, elem) 
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield(item)
    end
  end
  self
end