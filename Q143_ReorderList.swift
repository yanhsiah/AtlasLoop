//
//  Q143_ReorderList.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class ReorderList {
    
    // time: O(N), space: O(1)
    func reorderList(_ head: ListNode?) {
        guard let head = head else { return }
        
        // Find the middle
        // 1 [2] 3 [4]
        var slow = head, fast = head
        while fast.next != nil && fast.next!.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
        }

        // Reverse after the middle then merge
        // 1 2 4 3
        // 1 4 2 3
        var p1 = head
        guard var p2 = reverse(slow.next) else { return }
        while true {
            slow.next = p2.next
            p2.next = p1.next
            p1.next = p2
            
            guard let p1n = p2.next, let p2n = slow.next else { break }
            p1 = p1n
            p2 = p2n
        }
    }
    
    // 206
    func reverse(_ head: ListNode?) -> ListNode? {
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
