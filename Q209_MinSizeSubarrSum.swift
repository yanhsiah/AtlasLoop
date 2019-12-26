//
//  Q209_MinSizeSubarrSum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class MinSizeSubarrSum {
    // time: O(N), space: O(1)
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var start = 0, end = 0, sum = 0
        var res = nums.count + 1
        while end < nums.count {
            sum += nums[end]
            end += 1
            while sum >= s {
                res = min(res, end - start)
                sum -= nums[start]
                start += 1
            }
        }
        return res > nums.count ? 0 : res
    }
}
