def remove_element(nums, val)
    nums_count = total_count = nums.size

    for i in nums_count.downto(0)
        if nums[i] == val
            nums.delete_at(i)
            total_count -= 1
        end
    end
    total_count
end