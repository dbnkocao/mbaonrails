def majority_element(nums)
  hash = {}
  length = nums.size
  max_count = 0
  max_num = 0

  for i in 0..length-1
      hash[nums[i]] ||= 0
      hash[nums[i]] += 1
  end

  hash.each_pair do |num, count|
      if count > max_count
          max_count = count
          max_num = num
      end
  end

  return max_num
end