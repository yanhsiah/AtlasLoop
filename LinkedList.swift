//
//  LinkedList.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class ListNode<T> {
    var val: T
    var next: ListNode<T>?
    weak var prev: ListNode?
    init(_ val: T) { self.val = val }
}
class List<T> {
    private var head: ListNode<T>?, tail: ListNode<T>?
    var count = 0
    var first: T? { return self.head?.val }
    var last: T? { return self.tail?.val }
    var isEmpty: Bool { return self.head == nil }

    func append(_ val: T) -> ListNode<T> {
        let node = self.add(self.tail, val)
        self.tail = node
        if self.head == nil { self.head = node }
        return node
    }
    func prepend(_ val: T) -> ListNode<T> {
        let node = self.add(nil, val)
        self.head = node
        if self.tail == nil { self.tail = node }
        return node
    }
    func insert(_ prev: ListNode<T>, _ val: T) -> ListNode<T> {
        if prev === self.tail { return self.append(val) }
        else { return self.add(prev, val) }
    }
    private func add(_ prev: ListNode<T>?, _ val: T) -> ListNode<T> {
        self.count += 1
        let node = ListNode(val)
        if self.isEmpty { return node }
        let next = prev == nil ? self.head : prev!.next
        next?.prev = node
        node.next = next
        prev?.next = node
        node.prev = prev
        return node
    }
    func removeFirst() {
        guard let head = self.head else { return }
        self.head = head.next
        self.head == nil ? self.tail = nil : self.remove(head)
    }
    func removeLast() {
        guard let tail = self.tail else { return }
        self.tail = tail.prev
        self.tail == nil ? self.head = nil : self.remove(tail)
    }
    func removeNode(_ node: ListNode<T>) {
        if node === self.head { self.removeFirst() }
        else if node === self.tail { self.removeLast() }
        else { self.remove(node) }
    }
    private func remove(_ node: ListNode<T>) {
        self.count -= 1
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.prev = nil
        node.next = nil
    }
    func description() -> String {
        var elements = [T]()
        var ptr = self.head
        while ptr != nil {
            elements.append(ptr!.val)
            ptr = ptr!.next
        }
        return "\(elements), head = \(String(describing: self.head?.val)), tail = \(String(describing: self.tail?.val))"
    }
}
