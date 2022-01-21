import pandas as pd


def load_words():
    with open('dictionary.txt') as word_file:
        words_collection = word_file.read().split()

    return words_collection


if __name__ == '__main__':

    english_words = load_words()
    df = pd.DataFrame({'words': english_words})
    while(1):
        print("If you want 4 letter word starting with s then input : s...")
        word = str(input("Enter the word hint : "))
        if word in ['q', 'Q']:
            exit()
        pattern = '(^'+word.lower()+'$)'
        # print(pattern)
        matches = df['words'].str.extractall(
            pattern).unstack().apply(','.join, 1).values
        print(matches)
        print("\nEnter q to quit.\n")
