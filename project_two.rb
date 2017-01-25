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
        new_arr = Array.new
        self.my_each do |x|
          if yield(x)
            new_arr.push(x)
          end
        end
        new_arr
      end

      def my_all?
        true_or_false = true
        self.my_each do |x|
          unless yield(x)
            true_or_false = false
          end
        end
        true_or_false
      end

      def my_any?
        true_or_false = false
        self.my_each do |x|
          if yield(x)
            true_or_false = true
          end
        end
        true_or_false
      end

      def my_none?
        true_or_false = true
        self.my_each do |x|
          if yield(x)
            true_or_false = false
          end
        end
        true_or_false
      end

      def my_count
        counter = 0
        self.my_each do |x|
          if yield(x)
            counter += 1
          end
        end
        counter
      end

      def my_map
        new_arr = Array.new
        self.my_each do |x|
          yield(x)
          new_arr.push(yield(x))
        end
        new_arr
      end

      def my_inject
        sum = self[0]
        self.my_each do |x|
          unless x == self[0]
          sum = yield(sum, x)
          end
        end
        sum
      end

      def my_map_2(proc)
        new_arr = []
        self.each do |x|
            if block_given?
              proc.call(x)
              new_arr.push(proc.call(x))
            else
              yield(x)
              new_arr.push(yield(x))
            end
          end
        new_arr
      end
    end

    def multiply_els(arr)
      return arr.my_inject { |sum, x| sum * x}
    end

    my_proc = Proc.new { |x| x.to_f }
    

arr = [1,2,3,4,5]
puts arr.my_each { |x| puts x }
puts arr.my_each_with_index {|x, y| puts y }
puts arr.my_select { |x| x.even? }
puts arr.my_all? { |x| x.integer? }
puts arr.my_all? { |x| x }
puts arr.my_any? { |x| x == 6 }
puts arr.my_none? { |x| x > 6 }
puts arr.my_count { |x| x < 4 }
puts arr.my_map { |x| x +=1 }

puts arr.my_inject { |sum, x| sum + x}
puts multiply_els([2,4,5])
#puts arr.my_inject_test #{ |sum, x| sum + x }


longest = %w{ cat sheep bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
puts longest


puts arr.my_map_2(my_proc) { |x| x += 1 }
puts "Your program works!"
