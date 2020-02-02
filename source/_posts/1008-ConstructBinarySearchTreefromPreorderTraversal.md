Question:  
Return the root node of a binary search tree that matches the given preorder traversal.

(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

Example 1:
```
Input: [8,5,1,7,10,12]
Output: [8,5,10,1,7,null,12]
```
Note:  
1. 1 <= preorder.length <= 100
2. The values of preorder are distinct.

Solution:
```python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def bstFromPreorder(self, preorder):
        """
        :type preorder: List[int]
        :rtype: TreeNode
        """
        if not preorder:    return None;
        root = TreeNode(preorder[0])
        N = len(preorder)
        i = 1
        while i < N:
            if preorder[i] > preorder[0]:
                break
            i += 1
        root.left = self.bstFromPreorder(preorder[1:i])
        root.right = self.bstFromPreorder(preorder[i:])
        return root
```
Time Complexity: O(n*logn)  
Space Complexity: O(n)