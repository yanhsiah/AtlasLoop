//
//  Q295_MedianFromDataStream.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class Heap {
    private var nums = [Int]()
    var count: Int { return nums.count }
    var first: Int? { return nums.first }
    private let cmp: (Int, Int) -> Bool
    init(_ cmp: @escaping (Int, Int) -> Bool) { self.cmp = cmp }
    
    // time: O(logN)
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
    
    // time: O(logN)
    func remove() -> Int {
        guard !nums.isEmpty else { fatalError("empty") }
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

class MedianFinder {

    // time: O(logN), space: O(N)
    let lo = Heap(>), hi = Heap(<)

    // time: O(logN)
    func addNum(_ num: Int) {
        lo.append(num)
        hi.append(lo.remove())
        if lo.count < hi.count {
            lo.append(hi.remove())
        }
    }

    // time: O(1)
    func findMedian() -> Double {
        return lo.count > hi.count ? Double(lo.first!) : Double(lo.first! + hi.first!) / 2.0
    }
}
