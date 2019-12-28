//
//  Q53_MaximumSubarray.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class MaximumSubarray {
    // time: O(N), space: O(1)
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var localMax = nums[0], globalMax = localMax
        for i in 1..<nums.count {
            localMax = max(nums[i], localMax + nums[i])
            globalMax = max(globalMax, localMax)
        }
        return globalMax
    }
}
