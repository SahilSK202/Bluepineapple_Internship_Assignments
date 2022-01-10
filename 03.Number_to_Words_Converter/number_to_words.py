# A python program for converting number to word
# Reference : https://stackoverflow.com/questions/19504350/how-to-convert-numbers-to-words-without-using-num2word-library

def number_to_word_convert(num):

    units = (
        "", "one ", "two ", "three ", "four ", "five ", "six ", "seven ", "eight ", "nine ", "ten ", "eleven ",
        "twelve ",
        "thirteen ", "fourteen ", "fifteen ", "sixteen ", "seventeen ", "eighteen ", "nineteen ")
    tens = ("", "", "twenty-", "thirty-", "forty-", "fifty-",
            "sixty-", "seventy-", "eighty-", "ninety-")
    # orders of magnitude (oom) added
    oom = ('thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion', 'sextillion', 'septillion',
           'octillion', 'nonillion', 'decillion', 'undecillion', 'duodecillion', 'tredecillion', 'quattuordecillion',
           'quindecillion', 'sexdecillion', 'septendecillion', 'octodecillion', 'novemdecillion', 'vigintillion')

    if num < 0:
        return "minus " + number_to_word_convert(-num)

    if num < 20:
        return units[num]

    if num < 100:
        return tens[num // 10] + units[num % 10]

    if num < 10 ** 3:
        return units[num // 10 ** 2] + "hundred and " + number_to_word_convert(num % 10 ** 2)

    for idx, name in enumerate(oom):
        scale = (idx + 1) * 3
        cap = scale + 3
        if num < 10 ** cap:
            return number_to_word_convert(num // 10 ** scale) + name + " " + number_to_word_convert(num % 10 ** scale)

    return "tends to infinity"


def number_to_word_convert2(number):
    from num2words import num2words
    return num2words(number)


number = int(input("Enter any integer number:"))

print(number_to_word_convert(number))

print(number_to_word_convert2(number))
