local words = {"apple", "banana", "cherry", "durian", "elderberry"}

local function selectWord()
    local randomIndex = math.random(1, #words)
    return words[randomIndex]
end

local function displayWord(word, guesses)
    local displayedWord = ""
    for i = 1, #word do
        local letter = word:sub(i, i)
        if guesses[letter] then
            displayedWord = displayedWord .. letter .. " "
        else
            displayedWord = displayedWord .. "_ "
        end
    end
    return displayedWord
end

local function checkWin(word, guesses)
    for i = 1, #word do
        local letter = word:sub(i, i)
        if not guesses[letter] then
            return false
        end
    end
    return true
end

local function playHangman()
    print("Welcome to Hangman!")
    local word = selectWord()
    local guesses = {}
    local attempts = 6

    while attempts > 0 do
        print("\nWord:", displayWord(word, guesses))
        print("Attempts remaining:", attempts)

        io.write("Guess a letter: ")
        local letter = io.read():sub(1, 1)
        guesses[letter] = true

        if word:find(letter) then
            print("Correct guess!")
        else
            attempts = attempts - 1
            print("Incorrect guess!")
        end

        if checkWin(word, guesses) then
            print("\nCongratulations! You won!")
            return
        end
    end

    print("\nGame over! You ran out of attempts. The word was:", word)
end

math.randomseed(os.time())
playHangman()
