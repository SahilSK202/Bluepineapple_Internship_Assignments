# Python program to print perfect numbers in an interval

def is_Perfect_Number(n):  #user-defined function
   if n < 2:
      return False

   perfect_sum = 1
   for i in range(2,n//2+1):
      if n%i==0:
         perfect_sum += i
   return perfect_sum == n

# take inputs
min_value = int(input('Enter any minimum value: '))
max_value = int(input('Enter any maximum value: '))

# calling function and print perfect numbers
print('Perfect numbers from %d to %d are:' %(min_value, max_value))
for i in range(min_value, max_value+1):
   if is_Perfect_Number(i):
      print(i, end=', ')

