//
//  Q23_MergeKSortedLists.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/15.
//

import Foundation

class MergeKSortedLists {
    
    // K: # lists, N: # nodes in each list
    // time: O(NKlogK), space: O(1)
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        
        var lists = lists
        var start = 0, end = lists.count - 1
        while end > 0 {
            start = 0
            while start < end {
                lists[start] = merge(lists[start], lists[end])
                start += 1
                end -= 1
            }
        }
        return lists[0]
    }
    
    // time: O(A+B), space: O(1)
    func merge(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var ptr = dummy
        var a = a, b = b
        while a != nil && b != nil {
            if a!.val < b!.val {
                ptr.next = a
                a = a!.next
            } else {
                ptr.next = b
                b = b!.next
            }
            ptr = ptr.next!
        }
        ptr.next = a ?? b
        return dummy.next
    }
}
