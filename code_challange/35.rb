def search_insert(nums, target)
    nums_size = nums.size

    for i in 0..nums_size-1
       if nums[i] >= target
          return i
        end
    end
    return nums_size

end