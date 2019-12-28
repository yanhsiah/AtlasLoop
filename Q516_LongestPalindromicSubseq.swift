//
//  Q516_LongestPalindromicSubseq.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class LongestPalindromicSubseq {
    
    // time: O(2^N), space: O(2^N) for brute force
    // time: O(N^2), space: O(N^2) for memorization
    func longestPalindromeSubseq(_ s: String) -> Int {
        return dfs(0, s.count - 1, Array(s))
    }
    var cache = [Int: [Int: Int]]()  ///
    func dfs(_ l: Int, _ r: Int, _ s: [Character]) -> Int {
        if l == r { return 1 }
        if l > r { return 0 }
        if let rights = cache[l], let res = rights[r] { return res } ///
        let res = s[l] == s[r] ? (2+dfs(l+1, r-1, s)) : max(dfs(l+1, r, s), dfs(l, r-1, s))
        cache[l, default: [Int: Int]()][r] = res
        return res
    }
    
    /*
    func longestPalindromeSubseq(_ s: String) -> Int {
    
        // time: O(N^2), space: O(N^2)
        let s = Array(s)
        let n = s.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in stride(from: n-1, through: 0, by: -1) {
            dp[i][i] = 1
            for j in i+1..<n {
                if s[i] == s[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
            }
        }
        return dp[0][n-1]

        // time: O(N^2), space: O(N)
        // let s = Array(s)
        // let n = s.count
        // var dp = Array(repeating: 0, count: n)
        // for i in stride(from: n-1, through: 0, by: -1) {
        //     var ndp = Array(repeating: 0, count: n)
        //     ndp[i] = 1
        //     for j in i+1..<n {
        //         if s[i] == s[j] {
        //             ndp[j] = dp[j-1] + 2
        //         } else {
        //             ndp[j] = max(dp[j], ndp[j-1])
        //         }
        //     }
        //     swap(&ndp, &dp)
        // }
        // return dp[n-1]
    }
    */
    
    
    // LPS = LCS(s, String(s.reversed()))
    /*
    func longestPalindromeSubseq(_ s: String) -> Int {
        return LCS(s, String(s.reversed()))
    }
    // 1143
    func LCS(_ text1: String, _ text2: String) -> Int {
        if text1.count < text2.count { return LCS(text2, text1) }
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
    }
     */
}
