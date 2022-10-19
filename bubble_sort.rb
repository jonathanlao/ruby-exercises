
def bubble_sort(values)
  first, last = 0, values.length

  values.length.times do
    for j in first...last-1
      if values[j] > values[j+1]
        values[j], values[j+1] = values[j+1], values[j]
      end
    end
  end
  
  values
end

p bubble_sort([4,3,78,2,0,2])