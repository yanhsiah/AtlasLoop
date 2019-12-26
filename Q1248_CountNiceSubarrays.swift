//
//  Q1248_CountNiceSubarrays.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class CountNiceSubarrays {
    // time: O(N), space: O(1)
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        return atMostK(nums, k) - atMostK(nums, k - 1)
    }
    func atMostK(_ nums: [Int], _ k: Int) -> Int {
        var start = 0, end = 0, k = k
        var res = 0
        while end < nums.count {
            k -= nums[end] % 2         // odd numbers
            end += 1
            while k < 0 {
                k += nums[start] % 2
                start += 1
            }
            res += end - start
        }
        return res
    }
}
