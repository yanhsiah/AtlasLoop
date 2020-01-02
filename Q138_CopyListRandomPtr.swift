//
//  Q138_CopyListRandomPtr.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class CopyListRandomPtr {
    
    // time: O(N), space: O(1)
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        var l1: Node?, l2: Node?

        l1 = head
        while l1 != nil {
            l2 = Node(l1!.val, l1!.next, nil)
            l1!.next = l2
            l1 = l1!.next!.next
        }
        
        l1 = head
        while l1 != nil {
            if l1!.random != nil {
                l1!.next!.random = l1!.random!.next
            }
            l1 = l1!.next!.next
        }
        
        let res = head.next
        l1 = head
        while l1 != nil {
            l2 = l1!.next
            l1!.next = l2!.next
            if l2!.next != nil { l2!.next = l2!.next!.next }
        }
        return res
    }
}
