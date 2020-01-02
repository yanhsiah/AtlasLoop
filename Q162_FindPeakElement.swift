//
//  Q162_FindPeakElement.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class FindPeakElement {
    // time: O(logN), space: O(1)
    func findPeakElement(_ nums: [Int]) -> Int {
        var start = 0, end = nums.count - 1
        while start < end {
            let m = start + (end - start) / 2
            if nums[m] < nums[m + 1] { start = m + 1 }
            else { end = m }
        }
        return start
    }
}
