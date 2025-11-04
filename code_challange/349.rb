# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
    intersection = []
    for i in 0..nums1.size-1
        for j in 0..nums2.size-1
            if nums1[i] == nums2[j]
                intersection << nums1[i]
            end
        end
    end

    intersection.uniq
end