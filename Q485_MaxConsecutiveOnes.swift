//
//  Q485_MaxConsecutiveOnes.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class Solution {

    // time: O(N), space: O(1)
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var res = 0
        var count = 0
        for i in 0..<nums.count {
            if nums[i] == 1 {
                count += 1
            } else {
                res = max(res, count)
                count = 0
            }
        }
        return max(res, count)
    }
}
