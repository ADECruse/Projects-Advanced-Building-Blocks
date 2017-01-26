#!/usr/bin/env ruby

# The task of project two is to recreate the Ruby Enumerable methods
# My recreated methods are below

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

# For my version of the map method I was tasked to make sure that if given both a Proc and a block that only the Proc would run

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

# Below are the results of my methods compared to the original Enumerable methods

def multiply_els(arr)
  arr.my_inject { |sum, x| sum * x }
end

my_proc = Proc.new { |x| x.to_f }

arr = [1, 2, 3, 4, 5]
puts "#each"
puts arr.my_each { |x| puts x }
puts arr.each { |x| puts x }
puts "#each_with_index"
puts arr.my_each_with_index { |x, y| puts "#{x} #{y}" }
puts arr.each_with_index { |x, y| puts "#{x} #{y}" }
puts "#select"
puts arr.my_select { |x| x.even? }
puts arr.select { |x| x.even? }
puts "#all?"
puts arr.my_all? { |x| x.integer? }
puts arr.all? { |x| x.integer? }
puts "#any?"
puts arr.my_any? { |x| x == 6 }
puts arr.any? { |x| x == 6 }
puts "#none?"
puts arr.my_none? { |x| x > 6 }
puts arr.none? { |x| x > 6 }
puts "#count"
puts arr.my_count { |x| x < 4 }
puts arr.count { |x| x < 4 }
puts "#map"
puts arr.my_map { |x| x += 1 }
puts arr.map { |x| x += 1 }
puts
puts arr.my_map(my_proc) { |x| x += 1 }
puts "#inject"
puts arr.my_inject { |sum, x| sum + x }
puts arr.inject { |sum, x| sum + x }
puts
puts multiply_els([2, 4, 5])
