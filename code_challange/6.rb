def convert(s, num_rows)
    total_letters = s.size
    words = []
    last_row = num_rows - 1
    num_rows.times do
        words << []
    end
    row = 0
    column = 0
    direction = "down"

    for i in 0..(s.size-1)
        words[row][column] = s[i]

        if num_rows != 1
            if direction == "down"
                row += 1
            else
                row -= 1
            end
        end

        if row == last_row || row == 0
            column += 1
            direction = direction == "down" ? "up" : "down"
        end
    end

    words.flatten.compact.join
end