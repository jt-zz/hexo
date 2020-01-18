### Description:  
### Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

### Example 1:
```
Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
```
### Example 2:
```
Input: "cbbd"
Output: "bb"
```

### Solution:
1. Brute Force
   ```java
    class Solution {
        /**
         * @description: Check if the string is palindromic
         * @param {String} 
         * @return: boolean
         */
        public boolean isPalindromic(String s){
            for(int i = 0, j = s.length()-1; i < j; i++, j--){
                if(s.charAt(i) != s.charAt(j))
                    return false;
            }
            return true;
        }
        
        public String longestPalindrome(String s) {
            //if the string is ""
            if(s.length() == 0)
                return "";
            int max = 0;
            String result = Character.toString(s.charAt(0));
            for(int i = 0; i < s.length()-1; i++){
                for(int j = i+1; j < s.length(); j++){
                    String temp = s.substring(i,j+1);
                    //if it is palindromic and longer than the preview one, update the substring and it's length.
                    if(isPalindromic(temp) == true && max < (j-i+1)){
                        max = j-i+1;
                        result = temp;
                    }
                }
            }
            return result;
        }
    }
   ```
   #### Time complexity: 
   #### Place complexity:
2. 