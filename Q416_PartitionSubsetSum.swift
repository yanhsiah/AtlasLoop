//
//  Q416_PartitionSubsetSum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class PartitionSubsetSum {
    
    /*
    // top down DFS
    // time: O(2^N + NlogN) + pruning
    // space: O(2^N)
    func canPartition(_ nums: [Int]) -> Bool {
        var nums = nums
        var sum = nums.reduce(0, +)
        if sum & 1 == 1 { return false }
        sum /= 2
        
        nums.sorted(by: >)
        for num in nums {
            if num > sum { return false }
            if num == sum { return true }
            break
        }
        return dfs(&nums, sum, 0)
    }
    func dfs(_ nums: inout [Int], _ remain: Int, _ i: Int) -> Bool {
        if i >= nums.count || remain < nums.last! { return false }
        if remain == nums[i] { return true }
        return dfs(&nums, remain - nums[i], i+1) || dfs(&nums, remain, i+1)
    }
    */
    
    // bottom up DP
    // time: O(N * sum), space: O(sum)
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = nums.reduce(0, +)
        if sum & 1 == 1 { return false }
        sum /= 2
        let n = nums.count

        // dp[i][j]: sum j can be made from 0...<i
        // res = dp[n][sum]
        var dp = Array(repeating: Array(repeating: false, count: sum+1), count: n+1)
        for i in 0...n { dp[i][0] = true }
        for i in 1...n {
            for j in 1...sum {
                // pick i-th item or not
                let prevSum = j - nums[i-1]
                dp[i][j] = (prevSum >= 0 && dp[i-1][prevSum]) || dp[i-1][j]
            }
        }
        return dp[n][sum]

        /*
        var dp = Array(repeating: false, count: sum + 1)
        dp[0] = true
        for i in 1...n {
            var ndp = Array(repeating: false, count: sum + 1)
            ndp[0] = true
            for j in 1...sum {
                let prevSum = j - nums[i-1]
                ndp[j] = (prevSum >= 0 && dp[prevSum]) || dp[j]
            }
            swap(&ndp, &dp)
        }
        return dp[sum]
        */
    }
}
