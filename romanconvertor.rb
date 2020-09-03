def fromRoman(romanNumber)
    checkLetters(romanNumber)
    value = 0
    i = 0
    until i >= romanNumber.length do
        value = value + checkLetter(romanNumber, i)
        i = i + 1
    end
    return value
end

def checkLetter(romanNumber, index)
    letters = ["I", "V", "X", "L", "C", "D", "M"]
    letter = romanNumber[index]
    nextLetter = romanNumber[index + 1]
    if findBiggerLetters(letter).include? nextLetter then
        return -convertLetterToNumber(letter)
    end
    return convertLetterToNumber(letter)
end

def findBiggerLetters(letter)
    letterOrder = ["I", "V", "X", "L", "C", "D", "M"]
    if letter == "M" then
        return []
    end
    biggerLetters = []
    letterIndex = letterOrder.find_index(letter)
    i = letterIndex + 1
    until i >= letterOrder.length do
        biggerLetters.push(letterOrder[i])
        i = i + 1
    end
    return biggerLetters
end

def convertLetterToNumber(letter)
    if letter == "I" then
        return 1
    end
    if letter == "V" then
        return 5
    end
    if letter == "X" then
        return 10
    end
    if letter == "L" then
        return 50
    end
    if letter == "C" then
        return 100
    end
    if letter == "D" then
        return 500
    end
    if letter == "M" then
        return 1000
    end
end

def checkLetters(romanNumber)
    allowedLetters = ["I", "V", "X", "L", "C", "D", "M"]
    i = 0
    until i >= romanNumber.length do
        letter = romanNumber[i]
        if !allowedLetters.include? letter then
            raise TypeError
        end
        i = i + 1
    end
end

def toRoman(arabicNumber)
    if arabicNumber < 1 || arabicNumber >= 4000 then
        raise RangeError
    end
    romanNumber = ""
    value = arabicNumber
    ms = value / 1000
    if ms < 4 then
        romanNumber = romanNumber + "M" * ms
    end
    value = value - ms * 1000
    ds = value / 500
    romanNumber = romanNumber + "D" * ds
    value = value - ds * 500
    cs = value / 100
    if cs < 4 then
        romanNumber = romanNumber + "C" * cs
    end
    if cs == 4 then
        romanNumber = romanNumber + "CD"
    end
    value = value - cs * 100
    if value < 90 then
        ls = value / 50
        romanNumber = romanNumber + "L" * ls
        value = value - ls * 50
    end
    xs = value / 10
    if xs < 4 then
        romanNumber = romanNumber + "X" * xs
    end
    if xs == 4 then
        romanNumber = romanNumber + "XL"
    end
    if xs == 9 then
        romanNumber = romanNumber + "XC"
    end
    value = value - xs * 10
    vs = value / 5
    romanNumber = romanNumber + "V" * vs
    value = value - vs * 5
    is = value
    if is < 4 then
        romanNumber = romanNumber + "I" * is
    end
    if is == 4 then
        romanNumber = romanNumber + "IV"
    end
    value = value - is
    return romanNumber
end