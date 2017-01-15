=begin
Build a method #bubble_sort that takes an array and returns a sorted array.
It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn't it?).
=end
bubble_sort([4,3,78,2,0,2])

def bubble_sort(arr)
  n = 0
  swapped = false
  sorted = false

  until sorted == true
    if arr[n] > arr[n+1]
      arr[n], arr[n+1] = arr[n+1], arr[n]
      swapped = true
      if n == 4
        n = 0
      else
        n+=1
      end
    else
      if n == 4
        n = 0
        swapped = false
      else
        n+=1
      end
    end
    if n == 4 && swapped == false
      sorted = true
    end
  end
  arr
end
