//
//  Q528_RandomPickWeight.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class RandomPickWeight {

    // pick with weight: [1,2,4,3]
    // make it a accumelated sum arr [1,3,7,10]
    // [0 | 1,1 | 2,2,2,2 | 3,3,3]
    //  1   2 3   4     7   8   10

    var sums: [Int]
    init(_ w: [Int]) {
        sums = Array(repeating: 0, count: w.count)
        sums[0] = w[0]
        for i in 1..<w.count { sums[i] = sums[i-1] + w[i] }
    }

    func pickIndex() -> Int {
        return findInsertPos(sums, Int.random(in: 1...sums.last!))
    }

    func findInsertPos(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1
        while start < end {
            let m = start + (end - start) / 2
            if nums[m] < target { start = m + 1 }
            else { end = m }
        }
        return start
    }
}

/*
var q = RandomPickWeight([1,3])
var counts = Array(repeating: 0, count: 2)
for _ in 0..<100 { counts[q.pickIndex()] += 1 }
print(counts) // [25 75]
*/
