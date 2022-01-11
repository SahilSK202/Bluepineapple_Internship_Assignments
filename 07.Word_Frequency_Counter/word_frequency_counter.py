# Python program to find frequency of a particular word in the text

# Function which returns frequency of the all words in the given text
def word_frequency_counter(text):
    text = text.lower().split()
    freq = dict()   # Initialize a dictionary to keep the track of frequency of words
    for i in text:       # Loop until the EOS
        if (i in freq):    # If the key exists in dictionary, then increment the corresponding value for the key
            freq[i] = (freq[i] + 1)
        else:
            # If the key doesn't exist, initialize value for the corresponding key
            freq[i] = 1
    return freq


# Driver Code
text = input("Enter any text:\n")

freq = word_frequency_counter(text)

while(1):
    word = input("Enter any word :")
    if word.lower() in freq:
        print(f"Word '{word}' appears {freq[word]} times in above text.")
    else:
        print(f"Word '{word}' does not appear in above text.")
