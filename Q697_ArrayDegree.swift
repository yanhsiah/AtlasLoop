//
//  Q697_ArrayDegree.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/15.
//

import Foundation

class Solution {
    // time: O(N), space: O(N)
    func findShortestSubArray(_ nums: [Int]) -> Int {
        var res = nums.count, cache = [Int:(Int, Int, Int)](), deg = 1
        for i in 0..<nums.count {
            if let (count, left, right) = cache[nums[i]] {
                cache[nums[i]] = (count + 1, left, i)
                deg = max(deg, count + 1)
            } else {
                cache[nums[i]] = (1, i, i)
            }
        }

        for (count, left, right) in cache.values where count == deg {
            res = min(res, right - left + 1)
        }
        return res
    }
}
