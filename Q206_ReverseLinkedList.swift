//
//  Q206_ReverseLinkedList.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/15.
//

import Foundation

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        // time: O(N), space: O(N)
        /*
        guard let curr = head, let next = curr.next else { return head }
        let tail = reverseList(next)
        next.next = curr
        curr.next = nil
        return tail
        */

        // time: O(N), space: O(1)
        var prev: ListNode?
        var head = head
        while head != nil {
            let next = head!.next
            head!.next = prev

            prev = head
            head = next
        }
        return prev
    }
}
