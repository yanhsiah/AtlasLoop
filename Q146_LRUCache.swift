//
//  Q146_LRUCache.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class LRUCache {

    class Node {
        let key: Int
        var val: Int
        var prev: Node?, next: Node?
        init(_ key: Int, _ val: Int) { self.key = key; self.val = val }
    }
    class Keys {
        private let head = Node(0, 0), tail = Node(0, 0)
        init() {
            head.next = tail
            tail.prev = head
        }
        func prepend(_ node: Node) {
            node.next = head.next
            head.next?.prev = node
            node.prev = head
            head.next = node
        }
        func remove(_ node: Node) {
            node.next?.prev = node.prev
            node.prev?.next = node.next
            node.next = nil
            node.prev = nil
        }
        func removeLast() -> Node? {
            guard let last = tail.prev, last !== head else { return nil }
            remove(node)
            return node
        }
    }
    private let capacity: Int
    private var cache = [Int: Node]()
    private var keys = Keys()
    private func touch(_ node: Node) {
        keys.remove(node)
        keys.prepend(node)
    }

    // time: O(1), space: O(N)
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            touch(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if let node = cache[key] {
            node.val = value
            touch(node)
            return
        }

        if cache.count == capacity {
            if let key = keys.removeLast()?.key { cache[key] = nil }
        }
        let node = Node(key, value)
        cache[key] = node
        keys.prepend(node)
    }
}
