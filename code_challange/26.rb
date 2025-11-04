def remove_duplicates(nums)
    nums_count = total_count = nums.size

    for i in (nums_count-1).downto(1)
        if nums[i] == nums[i-1]
            nums.delete_at(i)
            total_count -=1
        end
    end
    total_count
end