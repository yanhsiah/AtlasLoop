//
//  Q487_MaxConsecutiveOnesII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class MaxConsecutiveOnesII {
    // time: O(N), space: O(1)
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var start = 0, end = 0, count = 0
        var res = 0
        while end < nums.count {
            if nums[end] == 0 { count += 1 }
            end += 1
            while count > 1 {
                if nums[start] == 0 { count -= 1 }
                start += 1
            }
            res = max(res, end - start)
        }
        return res
    }
}
