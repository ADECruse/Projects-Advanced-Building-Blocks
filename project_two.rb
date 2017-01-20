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

      def my_count

      end

      def my_map

      end

      def my_inject

      end

      def my_map

      end

    end

arr = [1,2,3,4,5]
puts arr.my_each { |x| puts x }
puts arr.my_each_with_index {|x, y| puts y }
puts arr.my_select { |x| x.even? }
puts arr.my_all? { |x| x.integer? }
puts arr.my_all? { |x| x }
puts arr.my_any? { |x| x == 6}
puts "Your program works!"
