//
//  Q34_FirstLastPosition.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

class FirstLastPosition {
    // time: O(NlogN), space: O(1)
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [-1, -1]
        var start = 0, end = nums.count - 1
        while start <= end {
            let m = start + (end - start) / 2
            if nums[m] < target { start = m + 1 }
            else { end = m - 1 }
        }
        guard start < nums.count && nums[start] == target else { return res }
        res[0] = start; end = nums.count - 1
        while start <= end {
            let m = start + (end - start) / 2
            if nums[m] <= target { start = m + 1 }
            else { end = m - 1 }
        }
        res[1] = end
        return res
    }
}
