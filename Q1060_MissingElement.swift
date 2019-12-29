//
//  Q1060_MissingElement.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

class MissingElement {
    
    // time: O(logN), space: O(1)
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count, total = missing(nums, n - 1)
        if k > total { return nums[n - 1] + (k - total) }

        var start = 0, end = n-1
        while start < end {
            let m = start + (end - start) / 2
            if missing(nums, m) < k { start = m + 1 }
            else { end = m }
        }
        return nums[0] + (start - 1) + k
        
        // missing(nums, start) is sufficient for cover k
        // missing(nums, start-1) is not enough for k
    }

    // return how many nums are missing until nums[i]
    func missing(_ nums: [Int], _ i: Int) -> Int {
        return nums[i] - nums[0] - i
    }
}
