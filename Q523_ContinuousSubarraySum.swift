//
//  Q523_ContinuousSubarraySum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

// 325 MaxSubarraySumK
// 523 ContinuousSubarraySum
// 525 ContiguousArray
// 560 SubarraySumEqualsK

class ContinuousSubarraySum {

    // time: O(N), space: O(N)
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var indexes = [0: -1]
        var remainder = 0
        for i in 0..<nums.count {
            remainder += nums[i]
            if k != 0 { remainder %= k }
            
            if let index = indexes[remainder] {
                if i - index > 1 { return true }
            } else {
                indexes[remainder] = i
            }
        }
        return false
    }
}
