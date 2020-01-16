//
//  Heap.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/31.
//

import Foundation

class Heap {
    private var nums = [Int]()
    var count: Int { return nums.count }
    var first: Int? { return nums.first }
    var isEmpty: Bool { return nums.isEmpty }

    private let cmp: (Int, Int) -> Bool
    init(_ cmp: @escaping (Int, Int) -> Bool) { self.cmp = cmp }
    
    func append(_ val: Int) {
        nums.append(val)
        var i = nums.count - 1
        while i != 0 {
            let p = (i - 1) / 2
            if cmp(nums[p], nums[i]) { break }
            nums.swapAt(p, i)
            i = p
        }
    }

    func remove() -> Int {
        let res = nums[0]
        nums.swapAt(0, nums.count - 1)
        nums.removeLast()
        
        func heapify(_ i: Int) {
            let l = 2 * i + 1, r = l + 1, n = nums.count
            var ptr = i
            if l < n && cmp(nums[l], nums[ptr]) { ptr = l }
            if r < n && cmp(nums[r], nums[ptr]) { ptr = r }
            if ptr != i { nums.swapAt(ptr, i); heapify(ptr) }
        }
        heapify(0)
        return res
    }
}

let pq = Heap(>)
pq.append(3)
pq.append(1)
pq.append(2)
while !pq.isEmpty { print(pq.remove()) }
// 3
// 2
// 1

class Heap<T> {
    private var items = [T]()
    private let cmp: (T, T) -> Bool
    init(_ cmp: @escaping (T, T) -> Bool) { self.cmp = cmp }
    var count: Int { return items.count }
    var first: T? { return items.first }
    
    func append(_ x: T) {
        items.append(x)
        var i = items.count - 1
        while i != 0 {
            let p = (i - 1) / 2
            if cmp(items[p], items[i]) { break }
            items.swapAt(p, i)
            i = p
        }
    }
    func remove() -> T {
        let res = items[0]
        items.swapAt(0, items.count - 1)
        items.removeLast()
        func heapify(_ i: Int) {
            let l = 2 * i + 1, r = l + 1, n = items.count
            var ptr = i
            if l < n && cmp(items[l], items[ptr]) { ptr = l }
            if r < n && cmp(items[r], items[ptr]) { ptr = r }
            if ptr != i { items.swapAt(ptr, i); heapify(ptr) }
        }
        heapify(0)
        return res
    }
}
