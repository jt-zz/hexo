### Description:  
### Given a string, find the length of the longest substring without repeating characters.

### Example 1:
```
Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 
```
### Example 2:
```
Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```
### Example 3:
```
Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
```
1. Solution-Brute Force
    ```java
    class Solution {
        public int lengthOfLongestSubstring(String s) {
            if(s.length() < 2)
                return s.length();
            int max = 0, len = 1, i = 0;
            String sub = s.substring(0,1);
            for(int j = i+1; j < s.length(); j++){
                String temp = s.substring(j,j+1);
                if(sub.contains(temp) == false){
                    sub = sub.concat(temp);
                    len += 1;
                }
                else{
                    i += sub.indexOf(temp) + 1;
                    len = j - i + 1;
                    sub = s.substring(i, j+1);
                }
                max = len > max ? len : max;
            }
            return max;
        }
    }
    ```