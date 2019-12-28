//
//  Q1216_ValidPalindromeIII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class ValidPalindromeIII {

    // s.count - LPS(s) <= k: s is a k-palindrome
    func isValidPalindrome(_ s: String, _ k: Int) -> Bool {
        return s.count - LPS(s) <= k
    }
    
    // 516
    func LPS(_ s: String) -> Int {
        // time: O(N^2), space: O(N)
        let s = Array(s)
        let n = s.count
        var dp = Array(repeating: 0, count: n)
        for i in stride(from: n-1, through: 0, by: -1) {
            var ndp = Array(repeating: 0, count: n)
            ndp[i] = 1
            for j in i+1..<n {
                if s[i] == s[j] {
                    ndp[j] = dp[j-1] + 2
                } else {
                    ndp[j] = max(dp[j], ndp[j-1])
                }
            }
            swap(&ndp, &dp)
        }
        return dp[n-1]
    }
}
