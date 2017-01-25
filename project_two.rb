#!/usr/bin/env ruby

module Enumerable
  def my_each
    i = 0
    l = self.length
    loop do
      yield self[i]
      i += 1
      break if i >= l
    end
  end

  def my_each_with_index
    i = 0
    l = self.length
    loop do
      yield self[i], self.index(self[i])
      i += 1
      break if i >= l
    end
  end

  def my_select
    new_arr = []
    self.my_each do |x|
      new_arr.push(x) if yield(x)
    end
    new_arr
  end

  def my_all?
    true_or_false = true
    self.my_each do |x|
      true_or_false = false unless yield(x)
    end
    true_or_false
  end

  def my_any?
    true_or_false = false
    self.my_each do |x|
      true_or_false = true if yield(x)
    end
    true_or_false
  end

  def my_none?
    true_or_false = true
    self.my_each do |x|
      true_or_false = false if yield(x)
    end
    true_or_false
  end

  def my_count
    counter = 0
    self.my_each do |x|
      counter += 1 if yield(x)
    end
    counter
  end

  def my_map(proc = nil)
    new_arr = []
    self.my_each do |x|
      unless proc.nil?
        new_arr << proc.call(x)
      else
        new_arr << yield(x)
      end
    end
    new_arr
  end

  def my_inject
    sum = self[0]
    self.my_each do |x|
      sum = yield(sum, x) unless x == self[0]
    end
    sum
  end
end

def multiply_els(arr)
  arr.my_inject { |sum, x| sum * x }
end

my_proc = Proc.new { |x| x.to_f }

arr = [1, 2, 3, 4, 5]
puts arr.my_each { |x| puts x }
puts arr.my_each_with_index { |x, y| puts "#{x} #{y}" }
puts arr.my_select { |x| x.even? }
puts
puts arr.my_all? { |x| x.integer? }
puts
puts arr.my_any? { |x| x == 6 }
puts
puts arr.my_none? { |x| x > 6 }
puts
puts arr.my_count { |x| x < 4 }
puts
puts arr.my_map { |x| x += 1 }
puts
puts arr.my_map(my_proc) { |x| x += 1 }
puts
puts arr.my_inject { |sum, x| sum + x }
puts
puts multiply_els([2, 4, 5])
longest = %w(cat sheep bear).my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest
puts
puts "Your program works!"
