// 83. Remove Duplicates from Sorted List
// https://leetcode.com/problems/remove-duplicates-from-sorted-list/

import Foundation

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        
        while let prev = current, let next = prev.next {
            if prev.val == next.val {
                prev.next = next.next
            } else {
                current = next
            }
        }

        return head
    }
}
