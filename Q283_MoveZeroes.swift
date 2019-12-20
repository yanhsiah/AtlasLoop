//
//  Q283_MoveZeroes.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/14.
//

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {

        // time: O(N), space: O(1)
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, j)
                j += 1
            }
        }
        
        /*
        var i = 0
        for (_, num) in nums.enumerated() {
            if (num != 0) {
                nums[i] = num
                i += 1
            }
        }
        while i < nums.count {
            nums[i] = 0
            i += 1
        }
        */
    }
}
