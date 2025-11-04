def find_max_consecutive_ones(nums)
    length = nums.size
    max_one = 0
    current_max = 0
    for i in 0..length-1
        if nums[i] == 1
            current_max += 1
            max_one = current_max if current_max > max_one
        else
            current_max = 0
        end
    end
    max_one
end