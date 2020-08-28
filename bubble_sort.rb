Question
Build a method "bubble_sort" that takes an array and returns a sorted array. It must use the bubble sort methodology (using "sort" would be pretty pointless, wouldn’t it?).
> bubble_sort([4,3,78,2,0,2])
=> [0,2,2,3,4,78]



# Solution using ruby
def bubble_sort(arr)
  sorted = false
  while sorted == false do
    sorted = true
    arr.each_with_index do |num, i|
      if i < arr.length - 1
        if num > arr[i + 1]
          sorted = false
          arr[i] = arr[i + 1]
          arr[i + 1] = num
        end
      end
    end
  end
  pp arr
end
  
  bubble_sort([4,3,78,2,0,2])


# Solution with JavaScript
const bubble_sort = (arr) => {
  sorted = 'False'

  while (sorted == 'False') {
    sorted = 'True'

    for(let i = 0; i < arr.length - 1; i++){
      if (i < arr.length - 1) {
        if (arr[i] > arr[i + 1]) {
          sorted = 'False'
          let temp_value = arr[i]
          arr[i] = arr[i + 1]
          arr[i + 1] = temp_value // We use a temp value because we won't have access to arr[i] anymore once we modify it in the line above.
        }
      }
    }
  }
  return arr
}

  console.log(bubble_sort([4,3,78,2,0,2]))