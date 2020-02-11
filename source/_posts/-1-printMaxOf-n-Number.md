Question: print all the numbers from 1 to n-digit biggest number

Example:
```
Input:2
Output: 1 2 3 4 5 6 7 8 9 10 11 12 13......99
```

Solution:  
To avoid the out of bound exception, it is better to use the char array to simulate origin process, and obviously the process is all the possibilities from 0-9 in all digits except first one, which could be implemented by a for loop from 0 to 9 and recursive call.
```python
def printToMaxOfDigits(n):
    ans = [0]*n
    for i in range(10):
        ans[0] = i
        printRecu(ans, n, 0)

def printRecu(nums, length, index):
    if index == length-1:
        printNumber(nums)
        return
    for i in range(10):
        nums[index+1] = i
        printRecu(nums, length, index+1)

def printNumber(num):
    res  = []
    for i in range(len(num)):
        if num[i] != 0:
            res.extend(num[i:])
            break
    for i in range(len(res)):
        res[i] = str(res[i])
    print (''.join(res))

if __name__ == "__main__":
    printToMaxOfDigits(5)
```