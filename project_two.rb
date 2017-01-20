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

      end

      def my_all?

      end

      def my_any?

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
puts "Your program works!"
