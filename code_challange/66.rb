def plus_one(digits)
    total_digits = digits.size
    rest_to_sum = 1
    for i in (total_digits-1).downto(0)
        digits[i] += rest_to_sum
        if digits[i] <= 9
            break
        else
            digits[i] = 0
            digits.insert(0,1) if i == 0
        end
    end
    digits
end