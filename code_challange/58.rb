def length_of_last_word(s)
    word_len = 0
    last_index = s.size - 1

    char = s[last_index]
    while char == " "
        last_index -= 1
        char = s[last_index]
    end

    for i in last_index.downto(0)
        if s[i] == " "
            break
        else
            word_len +=1
        end
    end

    word_len
end