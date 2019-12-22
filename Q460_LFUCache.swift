//
//  Q460_LFUCache.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class LFUCache {
    
    class Node {
        let key: Int
        var val: Int
        var freq = 1
        var prev: Node?, next: Node?
        init(_ key: Int, _ val: Int) { self.key = key; self.val = val }
    }
    class Keys {
        private let head = Node(0, 0), tail = Node(0, 0)
        private var count = 0
        var isEmpty: Bool { return count == 0 }
        init() {
            head.next = tail
            tail.prev = head
        }
        func prepend(_ node: Node) {
            node.next = head.next
            head.next?.prev = node
            node.prev = head
            head.next = node
            count += 1
        }
        func remove(_ node: Node) {
            node.next?.prev = node.prev
            node.prev?.next = node.next
            node.next = nil
            node.prev = nil
            count -= 1
        }
        func removeLast() -> Node? {
            guard !isEmpty, let node = tail.prev else { return nil }
            remove(node)
            return node
        }
    }
    private let capacity: Int
    private var cache = [Int: Node]()
    private var freqKeys = [Int: Keys]()
    private var minFreq = 1
    private func touch(_ node: Node) {
        if let keys = freqKeys[node.freq] {
            keys.remove(node)
            if keys.isEmpty {
                freqKeys[node.freq] = nil
                if minFreq == node.freq { minFreq += 1 }
            }
        }
        node.freq += 1
        place(node)
    }
    private func place(_ node: Node) {
        let keys = freqKeys[node.freq, default: Keys()]
        keys.prepend(node)
        freqKeys[node.freq] = keys
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
        if cache.count == capacity, let keys = freqKeys[minFreq] {
            if let key = keys.removeLast()?.key { cache[key] = nil }
            if keys.isEmpty { freqKeys[minFreq] = nil }
        }
        let node = Node(key, value)
        cache[key] = node
        minFreq = node.freq
        place(node)
    }
}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
