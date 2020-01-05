//
//  Q703_KLargestStream.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class Heap {
    private var nums = [Int]()
    var count: Int { return nums.count }
    var first: Int? { return nums.first }

    private let capacity: Int                               ///
    private let cmp: (Int, Int) -> Bool
    init(_ capacity: Int, _ cmp: @escaping (Int, Int) -> Bool) {
        self.capacity = capacity                            ///
        self.cmp = cmp
    }
    
    func append(_ val: Int) {
        if count == capacity && cmp(val, first!) { return } ///
        nums.append(val)
        var i = nums.count - 1
        while i != 0 {
            let p = (i - 1) / 2
            if cmp(nums[p], nums[i]) { break }
            nums.swapAt(p, i)
            i = p
        }
        if count > capacity { remove() }                    ///
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


class KthLargest {
    // space: O(K)
    let pq: Heap

    // time: O(NlogK)
    init(_ k: Int, _ nums: [Int]) {
        pq = Heap(k, <)
        nums.forEach { pq.append($0) }
    }
    
    // time: O(logK)
    func add(_ val: Int) -> Int {
        pq.append(val)
        return pq.first!
    }
}

