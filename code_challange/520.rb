def detect_capital_use(word)
    valid_patterns = [/[A-Z]*/, /[a-z]*/, /[A-Z]{1}[a-z]*/]

    valid_patterns.each do |pattern|
        match = word.match(pattern)[0]
        return true if match == word
    end
    false
end