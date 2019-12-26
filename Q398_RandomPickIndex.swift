//
//  Q398_RandomPickIndex.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class Solution {

    // https://gregable.com/2007/10/reservoir-sampling.html
    // Read the first node, answer = res (100%)
    // Read second node, answer being replaced by the second is 50%
    // Read third node, answer being replaced by the third node is 1/3
    // Read n-th node, answer being replaced by n-th node is 1/n

    // time: O(1), space: O(1)
    var nums: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }

    // time: O(N), space: O(1)
    func pick(_ target: Int) -> Int {
        var index = -1
        var count = 0
        for i in 0..<nums.count {
            if nums[i] != target { continue }
            count += 1
            if Int.random(in: 0..<count) == 0 { index = i }
        }
        return index
    }
}
