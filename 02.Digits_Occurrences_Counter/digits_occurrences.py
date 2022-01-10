# Python program to occurrences of each digit in the given input number

# Function which returns frequency of the digits in the given number
def occurrence_calculator(x):
    x = abs(x)
    freq = dict()   # Initialize a dictionary to keep the track of frequency of digits
    while(x):       # Loop until the number is not reduced
        unit_dig = x % 10    # Get the last unit digit
        if (unit_dig in freq):    # If the key exists in dictionary, then increment the corresponding value for the key
            freq[unit_dig] = (freq[unit_dig] + 1)
        else:
            # If the key doesn't exist, initialize value for the corresponding key
            freq[unit_dig] = 1
        x = int(x/10)
    return freq


def occurrence_calculator2(x):
    from collections import Counter  # Import Counter from collections
    return Counter(str(abs(x)))


number = int(input("Enter any integer number:"))
print("By Method 1")
print(occurrence_calculator(number))
print("By Method 2")
print(occurrence_calculator2(number))
