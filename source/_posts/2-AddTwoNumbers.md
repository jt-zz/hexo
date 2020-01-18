### Question:  
### You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

### You may assume the two numbers do not contain any leading zero, except the number 0 itself.

### Example:

### Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)  
### Output: 7 -> 0 -> 8  
  
### Explanation: 342 + 465 = 807.
  
1. Solution-Divide into 2 loops:  
   ```java
    //At first, I naturally think of the method that calculate the shorter part, then deal with the remain part of the longer linked list.
    class Solution {
        public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
            int up = 0;
            ListNode l = new ListNode(0);
            ListNode result = l;
            while (l1 != null && l2 != null) {
                int temp = l1.val + l2.val + up;
                if (temp >= 10) {
                    l.val = temp % 10;
                    up = 1;
                } else {
                    l.val = temp;
                    up = 0;
                }
                l1 = l1.next;
                l2 = l2.next;
                if (l1 != null || l2 != null ){
                    l.next = new ListNode(0);
                    l = l.next;
                }
                //Be careful with this extreme case, during which the two linked lists are at the same length and produce an extra bit, thus, an extra linked list with value 1.
                if(l1 == null && l2 == null && up == 1){
                    l.next = new ListNode(1);
                    l = l.next;
                    return result;
                }
            }
            //if l1 is longer
            while (l1 != null) {
                int temp = l1.val + up;
                if (temp >= 10) {
                    l.val = temp % 10;
                    up = 1;
                } else {
                    l.val = temp;
                    up = 0;
                }
                l1 = l1.next;
                if (l1 != null || (l1 == null && up == 1)){
                    l.next = new ListNode(1);
                    l = l.next;
                }
            }
            //if l2 is longer
            while (l2 != null) {
                int temp = l2.val + up;
                if (temp >= 10) {
                    l.val = temp % 10;
                    up = 1;
                } else {
                    l.val = temp;
                    up = 0;
                }
                l2 = l2.next;
                if (l2 != null || (l2 == null && up == 1)){
                    l.next = new ListNode(1);
                    l = l.next;
                }
            }
            return result;
        }
    }
2. Solution-Calculate with one loop  
   ```java
    //Obviously it is much more brief to calculate in one loop, take care to check if the pointer exists and the last node.
    class Solution {
        public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
            ListNode l = new ListNode(1);
            ListNode result = l, pivot = l;
            int up = 0;
            while(l1 != null || l2 != null){
                int v1 = l1 == null ? 0 : l1.val;
                int v2 = l2 == null ? 0 : l2.val;
                int temp = v1 + v2 + up;
                l.val = temp >= 10 ? temp % 10 : temp;
                up = temp >= 10 ? 1 : 0;
                l.next = new ListNode(1);
                //add a pointer to keep track of penultimate node, in case the last node would be extra.
                pivot = l;
                l = l.next;
                if(l1 != null) l1 = l1.next;
                if(l2 != null) l2 = l2.next;
            }
            if(up == 0) pivot.next = null;
            return result;
        }
    }
    ```  

3. Solution-Add a dummyhead
   ```java
    //instead of recording penultimate node, we could use an extra node at the beginning.
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummyHead = new ListNode(0);
        ListNode p = l1, q = l2, curr = dummyHead;
        int carry = 0;
        while (p != null || q != null) {
            int x = (p != null) ? p.val : 0;
            int y = (q != null) ? q.val : 0;
            int sum = carry + x + y;
            carry = sum / 10;
            curr.next = new ListNode(sum % 10);
            curr = curr.next;
            if (p != null) p = p.next;
            if (q != null) q = q.next;
        }
        if (carry > 0) {
            curr.next = new ListNode(carry);
        }
    return dummyHead.next;
    }
   ```