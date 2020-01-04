//
//  Q31_NextPermutation.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

class NextPermutation {
    
    // time: O(N), space: O(1)
    // 1 2 [35] 4
    // 1 2 [4] 5 [3]
    // 1 2 4 [35]
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        var start = n-2, end = n-1
        while start >= 0 {
            if nums[start] < nums[start+1] { break }
            start -= 1
        }
        if start >= 0 {
            while end >= 0 {
                if nums[end] > nums[start] { break }
                end -= 1
            }
            if end >= 0 { nums.swapAt(start, end) }
        }
        
        start = start+1
        end = n-1
        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}
