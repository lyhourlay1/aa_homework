#O(n^2)

def sluggish_octopus(arr)
    max=0
    arr.each.with_index do |ele,i|
        arr.each.with_index do |ele2,i2|
            if ele > ele2
                max =ele
            end
        end
    end
    max
end

#O(n log n) aka merge sort
def dominant_octopus(arr)
    merge_sort(arr)[-1]
end

def merge_sort(arr)
    return arr if arr.length <=1
    mid = arr.length/2
    left = merge_sort(arr[0...mid])
    right= merge_sort(arr[mid..-1])
    merge(left,right)
end

def merge(left,right)
    merged=[]
    while !left.empty? && !right.empty?
        if left[0].length< right[0].length
            merged<< left.shift
        else
            merged << right.shift
        end
    end
    merged + left + right
end

#clever Octo
def clever_octopus(arr)
    max=arr[0]
    arr.each do |ele|
        if max.length<= ele.length
            max=ele
        end
    end
    max
end

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(arr)
p dominant_octopus(arr)
p clever_octopus(arr)

def slow_dance(str, tiles_arr)
    tiles_arr.each.with_index do |ele,i|
        if str== ele
            return i
        end
    end
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

new_tiles_data_structure = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)
