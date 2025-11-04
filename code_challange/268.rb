def missing_number(nums)
    ordened_nums = []
    for i in 0..nums.size-1
        ordened_nums[nums[i]] = nums[i]
    end
    for i in 0..ordened_nums.size-1
        return i if ordened_nums[i].nil?
    end
    ordened_nums[-1] + 1
end