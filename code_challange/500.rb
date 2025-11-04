def find_words(words)
    result = []

    words.each do |word|
        result << word if keyboard_row?(word)
    end
    result

end

def keyboard_row?(original_word)
    word = original_word.downcase
    rows = [
        %w[q w e r t y u i o p],
        %w[a s d f g h j k l],
        %w[z x c v b n m]
    ]
    result = true
    correct_row = nil

    rows.each do |row|
        if row.include?(word[0])
            correct_row = row
            break
        end
    end

    word.each_char do |char|
        unless correct_row.include?(char)
            result = false
        end
    end
    result
end