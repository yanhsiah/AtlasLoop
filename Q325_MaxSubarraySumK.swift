//
//  Q325_MaxSubarraySumK.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

// 325 MaxSubarraySumK
// 523 ContinuousSubarraySum
// 525 ContiguousArray
// 560 SubarraySumEqualsK

class MaxSubarraySumK {

    // time: O(N), space: O(N)
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var dict = [0: -1] // prefix sum: index
        var res = 0, sum = 0
        for (i, num) in nums.enumerated() {
            sum += num
            if let index = dict[sum - k] {
                res = max(res, i - index)
            }
            if dict[sum] == nil { dict[sum] = i }
        }
        return res
    }
}
