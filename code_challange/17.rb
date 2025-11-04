def letter_combinations(digits)
    letters_per_number = { "2" => "abc", "3" => "def", "4" => "ghi", "5" => "jkl", "6" => "mno", "7" => "pqrs", "8" => "tuv", "9" => "wxyz"}
    end_count = digits.size == 1 ? 1 : digits.size - 2
    combinations = letters_per_number[digits[0]]&.split("") || []

    for i in 0..end_count
        new_combinations = []
        combinations.each do |co|
            next_letters = letters_per_number[digits[i+1]]
            next_letters&.each_char do |n_l|
                new_combinations << co + n_l
            end
        end
        combinations = new_combinations if new_combinations.any?
    end

    combinations
end