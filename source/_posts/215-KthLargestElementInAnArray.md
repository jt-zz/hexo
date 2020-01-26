Question:  
Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Example 1:  
Input: [3,2,1,5,6,4] and k = 2  
Output: 5 

Example 2:  
Input: [3,2,3,1,2,4,5,5,6] and k = 4  
Output: 4  

Note:  
You may assume k is always valid, 1 ≤ k ≤ array's length.

```java
class Solution {
    public void swap(int[] array, int a, int b){
        int temp = array[a];
        array[a] = array[b];
        array[b] = temp;
    }
    
    public int partition(int[] array, int low, int high){
        int pivot = array[low];
        int temp = low + 1;
        for(int i = low + 1; i <= high; i++){
            if(array[i] < pivot){
                swap(array, i, temp++);
            }
        }
        swap(array, --temp, low);
        return temp;
    }
    
    //in the base of quicksort, change the return condition
    public int quickSort(int[] nums, int begin, int end, int k){
        int index = partition(nums, begin, end);
        if(index + k == nums.length){
            return nums[index];
        }
        else if(index + k > nums.length){
            return quickSort(nums, begin, index-1, k);
        }
        else{
            return quickSort(nums, index+1, end, k);
        }
    }
    
    public int findKthLargest(int[] nums, int k) {
        return quickSort(nums, 0, nums.length-1, k);        
    }
}
```