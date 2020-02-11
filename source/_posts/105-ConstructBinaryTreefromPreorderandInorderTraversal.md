Question:  
Given preorder and inorder traversal of a tree, construct the binary tree.

Note:
You may assume that duplicates do not exist in the tree.

For example, given:  
preorder = [3,9,20,15,7]
inorder = [9,3,15,20,7]
Return the following binary tree:
```
    3
   / \
  9  20
    /  \
   15   7
```

Solution:
```py
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def buildTree(self, preorder, inorder):
        """
        :type preorder: List[int]
        :type inorder: List[int]
        :rtype: TreeNode
        """
        if (not preorder or not inorder):
            return None
        ans = TreeNode(preorder[0]);
        mid = inorder.index(preorder[0])
        if(mid != 0):
            ans.left = self.buildTree(preorder[1:mid+1], inorder[0:mid])
        if(mid != len(inorder)-1):
            ans.right = self.buildTree(preorder[mid+1:], inorder[mid+1:])
        return ans
        
```