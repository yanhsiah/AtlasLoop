//
//  Q525_ContiguousArray.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/15.
//

import Foundation

// 325 MaxSubarraySumK
// 523 ContinuousSubarraySum
// 525 ContiguousArray
// 560 SubarraySumEqualsK

class Solution {
    
    // Change 0 to -1, keep track of previous accumulated sum.
    // If current sum is the same (#1 = #-1), calcuate the count.
    // time: O(N), space: O(N)
    func findMaxLength(_ nums: [Int]) -> Int {
        var res = 0, sum = 0, sumIndexMap = [0: -1]
        for i in 0..<nums.count {
            sum += nums[i] == 1 ? 1 : -1
            if let index = sumIndexMap[sum] {
                res = max(res, i - index)
            } else {
                sumIndexMap[sum] = i
            }
        }
        return res
    }
}
