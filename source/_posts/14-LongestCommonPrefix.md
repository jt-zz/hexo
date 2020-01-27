Write a function to find the longest common prefix string amongst an array of strings.  
If there is no common prefix, return an empty string "".  

Example 1:  
Input: ["flower","flow","flight"]  
Output: "fl"  

Example 2:  
Input: ["dog","racecar","car"]
Output: ""  
Explanation: There is no common prefix among the input strings.  

Note:  
All given inputs are in lowercase letters a-z.

Solution:
```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        if(strs.length == 0)
            return "";
        String temp = "";
        for(int i = 1; i <= strs[0].length(); i++){
            temp = strs[0].substring(0, i);
            for(int j = 1; j < strs.length; j++){
                if(strs[j].indexOf(temp) != 0)
                    return temp.substring(0, temp.length()-1);
            }
        }
        return temp;
    }
}
````