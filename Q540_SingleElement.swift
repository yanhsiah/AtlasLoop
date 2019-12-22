//
//  Q540_SingleElement.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class SingleElement {
    // BS the first index that is diff with its partner
    // even ^ 1 = even + 1
    // odd ^ 1 = odd - 1
    // time: O(logN), space: O(1)
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var start = 0, end = nums.count - 1
        while start < end {
            let m = start + (end - start) / 2
            if nums[m] == nums[m ^ 1] { start = m + 1 }
            else { end = m }
        }
        return nums[start]
        
        // time: O(N)
        // return nums.reduce(0, ^)
    }
}
