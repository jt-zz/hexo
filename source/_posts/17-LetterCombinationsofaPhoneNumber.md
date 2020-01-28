Question:  
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Example:  
```
Input: "23"  
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
```
Note:  
Although the above answer is in lexicographical order, your answer could be in any order you want.

Solution:
```java
class Solution {
    public List<String> letterCombinations(String digits) {
        if(digits == null || digits.length() == 0)
            return new ArrayList<String>();
        String[] strs = new String[]{"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
        List<String> ans = new ArrayList<>();
        dfs(0, digits.length(), ans, "", strs, digits);
        return ans;
    }
    
    public void dfs(int l, int r, List<String>ans, String result, String[] strs, String digits){
        if(l == r){
            ans.add(result);
            return;
        }
        String temp = strs[digits.charAt(l)-'0'];
        for(int i = 0; i < temp.length(); i++){
            char c = temp.charAt(i);
            dfs(l+1, r, ans, result+c, strs, digits);
        }
    }
}
```