//
//  Q480_SlidingWindowMedian.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
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


class Solution {
    
    // https://leetcode.com/articles/sliding-window-median/
    // time: O(Nlogk), space: O(N)

    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        let lo = Heap(>), hi = Heap(<)
        var outs = [Int: Int]()
        var res = [Double](), i = 0
        
        while i < k { lo.append(nums[i]); i += 1}
        for j in 0..<k/2 { hi.append(lo.remove()) }
        while true {
            res.append(k & 1 == 1 ? Double(lo.first!) : Double(lo.first! + hi.first!) / 2.0)
            if i >= nums.count { break }
            
            let outNum = nums[i - k], inNum = nums[i]
            var balance = 0
            
            // out num
            balance += outNum <= lo.first! ? -1 : 1
            outs[outNum, default: 0] += 1
            
            // in num
            if inNum <= lo.first! {
                balance += 1
                lo.append(inNum)
            } else {
                balance -= 1
                hi.append(inNum)
            }
            
            // balance
            if balance < 0 { lo.append(hi.remove()) }
            if balance > 0 { hi.append(lo.remove()) }
            
            // lazy removal
            removeOuts(&outs, lo)
            removeOuts(&outs, hi)
            
            i += 1
        }
        return res
    }
    
    private func removeOuts(_ outs: inout [Int: Int], _ pq: Heap) {
        while !pq.isEmpty, let count = outs[pq.first!] {
            if count - 1 == 0 { outs[pq.first!] = nil }
            else { outs[pq.first!] = count - 1 }
            pq.remove()
        }
    }
}
