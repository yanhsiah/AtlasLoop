//
//  Q1143_LongestCommonSubseq.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class LongestCommonSubseq {
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        // time: O(MN), space: O(MN)
        let s1 = Array(text1), s2 = Array(text2)
        let m = s1.count, n = s2.count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for i in 1...m {
            for j in 1...n {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[m][n]
        
        
        // time: O(MN), space: O(min(M,N))
        /*
        if text1.count < text2.count { return longestCommonSubsequence(text2, text1) }
        let s1 = Array(text1), s2 = Array(text2)
        let m = s1.count, n = s2.count
        var dp = Array(repeating: 0, count: n+1)
        for i in 1...m {
            var ndp = Array(repeating: 0, count: n+1)
            for j in 1...n {
                if s1[i-1] == s2[j-1] {
                    ndp[j] = dp[j-1] + 1
                } else {
                    ndp[j] = max(dp[j], ndp[j-1])
                }
            }
            swap(&ndp, &dp)
        }
        return dp[n]
        */
    }
}
