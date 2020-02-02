Question:  
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Your algorithm's runtime complexity must be in the order of O(log n).

Example 1:
```
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
```
Example 2:
```
Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
```

Solution-1:Divide and Conquer:
```java
class Solution {
    public int search(int[] nums, int target) {
        if(nums.length == 0)
            return -1;
        return recursive(nums, target, 0, nums.length-1);
    }
    
    public int recursive(int[] nums, int target, int left, int right){
        if(left == right){
            if(nums[left] == target)
                return left;
            else
                return -1;
        }
        else if(nums[left] < nums[right]){
            if(nums[left] <= target && target <= nums[right])
                return binarySearch(nums, target, left, right);
            else
                return -1;
        }
        else{
            int mid = left + (right - left) / 2;
            if(nums[left] <= nums[mid]){
                if(nums[left] <= target && target <= nums[mid])
                    return binarySearch(nums, target, left, mid);
                else{
                    return recursive(nums, target, mid+1, right);
                }
            }
            else{
                if(nums[mid+1] <= target && target <= nums[right])
                    return binarySearch(nums, target, mid+1, right);
                else{
                    return recursive(nums, target, left, mid);
                }
            }
        }
    }
    
    public int binarySearch(int[] nums, int target, int left, int right){
        int pivot;
        while (left <= right) {
          pivot = left + (right - left) / 2;
          if (nums[pivot] == target) return pivot;
          if (target < nums[pivot]) right = pivot - 1;
          else left = pivot + 1;
        }
        return -1;
    }
}
```