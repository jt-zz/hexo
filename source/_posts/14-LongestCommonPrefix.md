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

Solution1-scanning:
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
n strings with length m
Time Complexity: O(m * n)
Space Complexity: O(1)

Solution2-Divide and Conquer
```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        if(strs == null || strs.length == 0)
            return "";
        else
            return recursiveFind(strs, 0, strs.length-1);
    }
    
    public String recursiveFind(String[] strs, int left, int right){
        if(left == right)
            return strs[left];
        int mid = left + (right - left) / 2;
        String leftPrefix = recursiveFind(strs, left, mid);
        String rightPrefix = recursiveFind(strs, mid+1, right);
        return commonPrefix(leftPrefix, rightPrefix);       //each time check the longest prefix between two subtrees
    }
    
    public String commonPrefix(String a, String b){//check the longest prefix between two Strings
        int minLength = Math.min(a.length(), b.length());
        for(int j = minLength - 1 ; j >= 0; j--){
            if(a.substring(0, j+1).equals(b.substring(0,j+1))){
                return a.substring(0, j+1);
            }
        }
        return "";
    }
```
worst: The String array contains n equals Strings with length m
Time Complexity: O(m * n)
Space Complexity: O(m * logn)

```java
//choose shortest String, binary search with its substring to other Strings.
public String longestCommonPrefix(String[] strs) {
    if (strs == null || strs.length == 0)
        return "";
    int minLen = Integer.MAX_VALUE;
    for (String str : strs)
        minLen = Math.min(minLen, str.length());
    int low = 1;
    int high = minLen;
    while (low <= high) {
        int middle = (low + high) / 2;
        if (isCommonPrefix(strs, middle))
            low = middle + 1;
        else
            high = middle - 1;
    }
    return strs[0].substring(0, (low + high) / 2);
}

private boolean isCommonPrefix(String[] strs, int len){
    String str1 = strs[0].substring(0,len);
    for (int i = 1; i < strs.length; i++)
        if (!strs[i].startsWith(str1))
            return false;
    return true;
}
```
Time Complexity: O(m * n * logn)
Space Complexity: O(1)
