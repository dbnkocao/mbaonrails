def find_relative_ranks(score)
    ordened_scores = []
    transformed_scores = []
    medals = ["Bronze Medal", "Silver Medal", "Gold Medal"]
    podium = {}
    score.each do |sc|
        ordened_scores[sc] = sc
    end

    next_position = 4
    while ordened_scores.size >= 1
        last = ordened_scores.pop

        if last != nil
            if medals.size >= 1
                podium[last] = medals.pop
            else
                podium[last] = next_position.to_s
                next_position +=1
            end
        end
    end
    score.each do |sc|
        transformed_scores << podium[sc]
    end
    transformed_scores
end