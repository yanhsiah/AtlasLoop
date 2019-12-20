//
//  Q560_SubarraySumEqualsK.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/19.
//

import Foundation

class SubarraySumEqualsK {
    // brute force: count sum(i, j) = k; time: O(N^2), space: O(1)
    // two sum: dict { prefixSum: count }; time: O(N), space: O(N)
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict = [0: 1]
        var res = 0, sum = 0
        for num in nums {
            sum += num
            if let count = dict[sum - k] {
                res += count
            }
            dict[sum, default: 0] += 1
        }
        return res
    }
}
