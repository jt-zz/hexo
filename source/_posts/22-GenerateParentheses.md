Question:  
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:  
[  
    "((()))",  
    "(()())",  
    "(())()",  
    "()(())",  
    "()()()"  
]

Solution1-Backtracking
```java
class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> strs = new ArrayList<String>();
        dfs(strs, "", n, 0, 0);
        return strs;
    }
    
    public void dfs(List<String> strs, String temp, int n, int left, int right){
        if(left == n && right == n){
            strs.add(temp);
            return;
        }
        if(left == right)
            dfs(strs, temp+'(', n, left+1, right);
        else{
            if(left < n)
                dfs(strs, temp+'(', n, left+1, right);
            dfs(strs, temp+')', n, left, right+1);
        }
            
    }
}
```

Our complexity analysis rests on understanding how many elements there are in `generateParenthesis(n)`,  it turns out this is the `n`-th Catalan number: $$\frac{1}{n+1}C_{2n}^n$$, which is bounded asymptotically by $$\dfrac{4^n}{n\sqrt{n}}$$

- Time Complexity : O (  $\dfrac{4^n}{n\sqrt{n}}$ ), Each valid sequence has at most `n` steps during the backtracking procedure.

- Space Complexity : O (  $\dfrac{4^n}{n\sqrt{n}}$ ),  as described above, and using O(n) space to store the sequence.

  

Solution2-Closure Number(DP):  
First consider how to get the result f(n) from previous result f(0)...f(n-1).
Actually, the result f(n) will be put an extra () pair to f(n-1). Let the "(" always at the first position, to produce a valid result, we can only put ")" in a way that there will be i pairs () inside the extra () and n - 1 - i pairs () outside the extra pair.

Let us consider an example to get clear view:

f(0): ""

f(1): "("f(0)")"

f(2): "("f(0)")"f(1), "("f(1)")"

f(3): "("f(0)")"f(2), "("f(1)")"f(1), "("f(2)")"

So f(n) = "("f(0)")"f(n-1) , "("f(1)")"f(n-2) "("f(2)")"f(n-3) ... "("f(i)")"f(n-1-i) ... "(f(n-1)")"
```java
class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> ans = new ArrayList();
        if (n == 0) {
            ans.add("");
        } else {
            for (int c = 0; c < n; ++c)
                for (String left: generateParenthesis(c))
                    for (String right: generateParenthesis(n-1-c))
                        ans.add("(" + left + ")" + right);
        }
        return ans;
    }
}
```
Time and Space Complexity : O ( $\dfrac{4^n}{n\sqrt{n}}$ )