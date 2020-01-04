//
//  Q494_TargetSum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class Solution {
    // time: O(2^N) --> O(Sum * N)
    // space: O(N)  --> O(Sum * N)
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        let sum = nums.reduce(0, +)
        if sum < S || (sum + S) & 1 == 1 { return 0 }

        return dfs(nums, S, 0, 0)
    }
 
    // 282
    var cache = [Int: [Int: Int]]() // [i: [sum: count]]
    func dfs(_ nums: [Int], _ target: Int, _ i: Int, _ sum: Int) -> Int {
        if i == nums.count { return sum == target ? 1 : 0 }
        if let sums = cache[i], let res = sums[sum] { return res }

        var res = dfs(nums, target, i + 1, sum + nums[i]) + dfs(nums, target, i + 1, sum - nums[i])
        cache[i, default: [:]][sum] = res
        return res
    }
}
