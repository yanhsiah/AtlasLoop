//
//  Q328_OddEvenLL.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/3.
//

import Foundation

class OddEvenLL {
    // time: O(N), space: O(1)
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var odd: ListNode? = head, even: ListNode? = head.next
        let evenHead = even
        while even != nil && even!.next != nil {
            odd!.next = even!.next
            odd = odd!.next
            
            even!.next = odd!.next
            even = even!.next
        }
        odd!.next = evenHead
        return head
    }
}
