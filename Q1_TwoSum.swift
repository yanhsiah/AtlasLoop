//
//  Q1_TwoSum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/14.
//

import Foundation

class TwoSum {
    // time: O(N), space: O(N)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let index = dict[target - num] {
                return [index, i]
            }
            dict[num] = i
        }
        return []
    }
}
