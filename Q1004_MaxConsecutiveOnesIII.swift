//
//  Q1004_MaxConsecutiveOnesIII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class MaxConsecutiveOnesIII {

    // Find the longest subarray with at most K zeros.
    // time: O(N), space: O(1)
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var start = 0, end = 0, count = 0
        var res = 0
        while end < A.count {
            if A[end] == 0 { count += 1 }
            end += 1
            while count > K {
                if A[start] == 0 { count -= 1 }
                start += 1
            }
            res = max(res, end - start)
        }
        return res
    }
}
