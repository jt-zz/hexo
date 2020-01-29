Solution:  
Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

Example:  
Input:
[
  1->4->5,
  1->3->4,
  2->6
]  
Output: 1->1->2->3->4->4->5->6

Solution-Divide and Conquer
```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode mergeKLists(ListNode[] lists) {
        if(lists.length == 0)
            return null;
        return divideConquer(lists, 0, lists.length-1);
    }
    
    public ListNode divideConquer(ListNode[] lists, int left, int right){
        if(right <= left){ 
            return mergeTwoLists(lists[left], null);
        }
        else if(right == left + 1){
            return mergeTwoLists(lists[left], lists[right]);
        }
        return (mergeTwoLists(divideConquer(lists, left, (left+right)/2), divideConquer(lists, (left+right)/2+1, right)));
    }
    
    public ListNode mergeTwoLists(ListNode l1, ListNode l2){
        ListNode dummy = new ListNode(0);
        ListNode curr = dummy;
        while(l1 != null && l2 != null){
            if(l1.val < l2.val){
                curr.next = l1;
                l1 = l1.next;
            }
            else{
                curr.next = l2;
                l2 = l2.next;
            }
            curr = curr.next;
        }
        if(l1 != null){
            curr.next = l1;
        }
        if(l2 != null){
            curr.next = l2;
        }
        return dummy.next;
    }
}
```
Time complexity : O ( N*logk ) where k is the number of linked lists  
Space complexity : O ( logk )