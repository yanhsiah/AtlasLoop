//
//  Q1027_LongestArithmeticSeq.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class LongestArithmeticSeq {
    
    // time: O(N^2), space: O(N^2)
    func longestArithSeqLength(_ A: [Int]) -> Int {
        guard A.count > 2 else { return A.count }

        // dp[i][d] = length of seq at index i with diff d
        var dp = Array(repeating: [Int:Int](), count: A.count)
        var res = 0
        for i in 0..<A.count {
            for j in 0..<i {
                let d = A[i] - A[j]
                let len = dp[j][d, default: 1] + 1
                dp[i][d] = len
                res = max(res, len)
            }
        }
        return res
        
        /*
        // dp[d][i]: length of arithmetic seq with d at index i
        guard A.count > 2 else { return A.count }
        var dp = [Int: [Int: Int]]()
        var res = 0
        for i in 0..<A.count {
            for j in i+1..<A.count {
                let d = A[j] - A[i]
                var counts = dp[d, default: [Int: Int]()]
                counts[j] = counts[i, default: 1] + 1
                dp[d] = counts
                dp[d, default: [Int: Int]()][j]
                res = max(res, counts[j]!)
            }
        }
        return res
        */
    }
}
