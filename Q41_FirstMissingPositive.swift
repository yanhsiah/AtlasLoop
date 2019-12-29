//
//  Q41_FirstMissingPositive.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

class FirstMissingPositive {
    
    // nums[i] = 5, if nums[4] != 5, swap (i, 4)
    // time: O(N), space: O(1)
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        let n = nums.count
        for i in 0..<n {
            var num = nums[i]
            while num > 0 && num <= n && num != nums[num - 1] {
                nums.swapAt(i, num - 1)
                num = nums[i]
            }
        }
        for i in 0..<n where nums[i] != i + 1 { return i + 1 }
        return n + 1
    }
}
