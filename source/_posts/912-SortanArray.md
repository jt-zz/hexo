Question:  
Given an array of integers nums, sort the array in ascending order.

Solution-1(quickSort):
```java
class Solution {    
    public void swap(int[] array, int a, int b){
        int temp = array[a];
        array[a] = array[b];
        array[b] = temp;
    }
    
    public int partition(int[] array, int low, int high){
        int pivot = array[low];
        int temp = low + 1;                     //do not move the pivot in the first postion until returning process
        for(int i = low + 1; i <= high; i++){   //each time finding a smaller one, should swap with the temp postion, then move temp to the next position waiting for the next smaller one.
            if(array[i] < pivot){
                swap(array, i, temp++);
            }
        }
        swap(array, --temp, low);//in the end, swap the pivot with the last smaller one, which is the previous position of temp position.
        return temp;
    }
    
    public void quickSort(int[] array, int begin, int end){
        if(begin >= end)
            return;
        int partitionIndex = partition(array, begin, end);
        quickSort(array, begin, partitionIndex-1);
        quickSort(array, partitionIndex+1, end);
    }
    
    public List<Integer> sortArray(int[] nums) {
        quickSort(nums, 0, nums.length-1);
        List<Integer> result = new ArrayList<>();
        for(int i = 0 ; i < nums.length; i++){
            result.add(nums[i]);
        }
        return result;
    }
}
```