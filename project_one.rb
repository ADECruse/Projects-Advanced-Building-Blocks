# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn't it?).

def bubble_sort(arr)
  sorted = false
  while sorted == false
    n = 0
    l = arr.length - 1
    swapped = false
    until n == l
      if arr[n] > arr[n + 1]
        arr[n], arr[n + 1] = arr[n + 1], arr[n]
        swapped = true
      end
      n += 1
    end
    sorted = true if swapped == false
  end
  arr
end

bubble_sort([4, 3, 78, 2, 0, 2])

# Now create a similar method called #bubble_sort_by which sorts an array but accepts a block.
# The block should take two arguments which represent the two elements currently being compared.

def bubble_sort_by(arr)
  sorted = false
  while sorted == false
    n = 0
    l = arr.length - 1
    swapped = false
    until n == l
      if yield(arr[n], arr[n + 1]) > 0
        arr[n], arr[n + 1] = arr[n + 1], arr[n]
        swapped = true
      end
      n += 1
    end
    sorted = true if swapped == false
  end
  arr
end

bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
  left.length - right.length
end
