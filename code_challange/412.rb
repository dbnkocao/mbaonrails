def fizz_buzz(n)
    result = []
    for i in 1..n
        answer = ""
        answer = answer + "Fizz" if i % 3 == 0
        answer = answer + "Buzz" if i % 5 == 0
        answer = i.to_s if answer == ""
        result << answer
    end
    result
end