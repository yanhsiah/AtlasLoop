//
//  Q78_Subsets.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/17.
//

import Foundation

class Subsets {
    // time: O(2^N), space: O(N)
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]](), comb = [Int]()
        let nums = nums.sorted()
        dfs(&res, &comb, nums, 0)
        return res
    }
    func dfs(_ res: inout [[Int]], _ comb: inout [Int], _ nums: [Int], _ start: Int) {
        res.append(comb)
        for i in start..<nums.count {
            comb.append(nums[i])
            dfs(&res, &comb, nums, i + 1)
            comb.removeLast()
        }
    }
}
