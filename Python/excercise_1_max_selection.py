#Write a Python function to find the maximum element in a list of numbers without using the built-in `max()` function.
#If the input list is None or it is empty list, the return value must be None.

# Requirements:
# - Returns greatest element of a list of numbers
# - In case of None input returns None
# - In case of Empty input string, returns None

def get_max(numbers:list) -> int:
    if numbers==None or numbers==[]:
        return None
    maximum=numbers[0]
    for i in numbers:
        if maximum <i:
            maximum=i
    return maximum
print(get_max([5,3,7,1,9,10]))

