//
//  Q708_InsertSortedCLL.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class Node {
    var val: Int, next: Node?
    init(_ val: Int, _ next: Node?) { self.val = val; self.next = next }
}

// time: O(N), space: O(1)
func insert(_ head: Node?, _ insertVal: Int) -> Node {
    guard let head = head else {
        let node = Node(insertVal, nil)
        node.next = node
        return node
    }
    
    var prev = head
    var next = head.next!
    while true {
        // prev < next for all cases except going from min to max
        // which prev = max and next = min, if insert val less than
        // min or larger than max, it should be inserted there.
        if prev.val < insertVal && insertVal < next.val ||
            prev.val > next.val && (insertVal > prev.val || insertVal < next.val) { break }
        prev = next
        next = next.next!
        if prev === head { break }
    }
    prev.next = Node(insertVal, next)
    return head
}



let tail = Node(1, nil)
let head = Node(3, Node(4, tail))
tail.next = head
insert(head, 2)
var ptr = head
for _ in 0..<4 {
    print(ptr.val)
    ptr = ptr.next!
}
// 3
// 4
// 1
// 2

var nohead: Node?
ptr = insert(nohead, 5)
for _ in 0..<1 {
    print(ptr.val)
    ptr = ptr.next!
}
// 5
