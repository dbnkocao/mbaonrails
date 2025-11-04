def add_digits(num)
    num = num.to_s

    while num.size > 1
        num = num.split("").sum { _1.to_i }
        num = num.to_s
    end

    return num.to_i
end