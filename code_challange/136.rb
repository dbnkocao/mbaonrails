def single_number(nums)
    nums.sort!
    length = nums.size
    return nums[0] if length == 1

    for i in 0..length-1
        if nums[i] != nums[i+1] && nums[i] != nums[i-1]
            return nums[i]
        end
    end
end