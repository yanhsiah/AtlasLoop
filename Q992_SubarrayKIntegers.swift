//
//  Q992_SubarrayKIntegers.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class SubarrayKIntegers {
    // time: O(N), space: O(1)
    func subarraysWithKDistinct(_ A: [Int], _ K: Int) -> Int {
        return atMostK(A, K) - atMostK(A, K-1)
    }
    func atMostK(_ nums: [Int], _ k: Int) -> Int {
        var start = 0, end = 0, counts = [Int: Int]()
        var res = 0
        while end < nums.count {
            counts[nums[end], default: 0] += 1
            end += 1
            while counts.count > k {
                if let count = counts[nums[start]], count > 1 {
                    counts[nums[start]] = count - 1
                } else {
                    counts[nums[start]] = nil
                }
                start += 1
            }
            res += end - start
        }
        return res
    }
    
    // Input: A = [1,2,1,2,3], K = 2
    // Output: 7
    // Explanation: Subarrays formed with exactly 2 different integers:
    // [1,2], [2,1], [1,2], [2,3], [1,2,1], [2,1,2], [1,2,1,2]
}
