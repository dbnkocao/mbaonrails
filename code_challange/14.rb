def longest_common_prefix(strs)
    prefix = ""

    200.times do |i|
        arr_string = []
        strs.each do |str|
            arr_string << str[i]
        end
        if arr_string.uniq.size == 1 && !arr_string[0].nil?
            prefix = prefix + arr_string[0]
        else
            break
        end
    end
    prefix
end