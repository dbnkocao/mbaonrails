def str_str(haystack, needle)
    n_size = needle.size
    h_size = haystack.size

    for i in 0..h_size-1
        if haystack[i] == needle[0]
            ocurrence = true
            for j in 1..n_size-1
                if haystack[i+j] != needle[j]
                    ocurrence = false
                    break;
                end
            end

            return i if ocurrence
        end
    end

    return -1
end