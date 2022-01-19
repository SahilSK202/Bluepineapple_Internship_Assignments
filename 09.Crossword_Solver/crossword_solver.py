import pandas as pd


def load_words():
    with open('dictionary.txt') as word_file:
        words_collection = word_file.read().split()

    return words_collection


if __name__ == '__main__':

    english_words = load_words()
    df = pd.DataFrame({'words': english_words})

    print("If you want 4 letter word starting with s then input : s...")
    word = str(input("Enter the word hint : "))
    n = len(word) - 1
    start_with = word[0].lower()
    pattern = '(^'+word.lower()+'$)'
    # pattern = '(^'+str(start_with)+'[a-z]'+'{'+str(n)+'}'+'$)'

    # matches = df['words'].str.extractall(
    #     pattern).unstack().apply(','.join, 1)
    # print(pattern)
    matches = df['words'].str.extractall(
        pattern).unstack().apply(','.join, 1).values
    print(matches)
