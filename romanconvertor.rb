def fromRoman(romanNumber)
    rom = romanNumber.dup
    @data = [
        ["M"  , 1000],
        ["CM" , 900],
        ["D"  , 500],
        ["CD" , 400],
        ["C"  , 100],
        ["XC" ,  90],
        ["L"  ,  50],
        ["XL" ,  40],
        ["X"  ,  10],
        ["IX" ,   9],
        ["V"  ,   5],
        ["IV" ,   4],
        ["I"  ,   1]
    ]   
    if (/^[IVXLCDM]*$/.match?(rom) == false)
        raise TypeError
    end
    ara = 0
    for key, value in @data
        while rom.index(key) == 0
            ara += value
            rom.slice!(key)
        end
    end
    return ara
end

def toRoman(arabicNumber)
    ara = arabicNumber.dup
    @data = [
        ["M"  , 1000],
        ["CM" , 900],
        ["D"  , 500],
        ["CD" , 400],
        ["C"  , 100],
        ["XC" ,  90],
        ["L"  ,  50],
        ["XL" ,  40],
        ["X"  ,  10],
        ["IX" ,   9],
        ["V"  ,   5],
        ["IV" ,   4],
        ["I"  ,   1],
    ]  

    if (ara > 3999 || ara < 1)
        raise RangeError
    end
    roman = ""

    @data.each do |pair|
        letter = pair[0]
        value = pair[1]
        roman += letter*(ara / value)
        ara = ara % value
    end
    return roman
end