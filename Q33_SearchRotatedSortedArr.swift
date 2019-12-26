//
//  Q33_SearchRotatedSortedArr.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class SearchRotatedSortedArr {
    
    // time: O(logN), space: O(1)
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1
        while start <= end {
            let m = start + (end - start) / 2
            if nums[m] == target { return m }
            if nums[start] <= nums[m] {
                if nums[start] <= target && target < nums[m] { end = m - 1 }
                else { start = m + 1 }
            } else {
                if nums[m] < target && target <= nums[end] { start = m + 1 }
                else { end = m - 1 }
            }
        }
        return -1
    }
}
