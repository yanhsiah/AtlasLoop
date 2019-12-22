//
//  Q139_WordBreak.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class Solution {
    // W: length of each word used in String(s[start..<end])
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        return dfs(Array(s), Set<String>(wordDict), 0)
    }
    
    // time: O(N^N * W), space: O(N)
    func dfs(_ s: [Character], _ words: Set<String>, _ start: Int) -> Bool {
        if start == s.count { return true }
        for len in 1...s.count-start {
            if words.contains(String(s[start..<start+len])) && dfs(s, words, start+len) {
                return true
            }
        }
        return false
    }
    
    // time: O(N^2 * W), space: O(N)
    var cache = [Int: Bool]()
    func dfs(_ s: [Character], _ words: Set<String>, _ start: Int) -> Bool {
        if start == s.count { return true }
        if let res = cache[start] { return res }
        var res = false
        for len in 1...s.count-start {
            if words.contains(String(s[start..<start+len])) && dfs(s, words, start+len) {
                res = true
                break
            }
        }
        cache[start] = res
        return res
    }
    
    // dp[i] = true if a valid word ends before it
    // time: O(N^2 * W), space: O(N)
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = Array(s)
        let words = Set<String>(wordDict)
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        for end in 1...s.count {
            for start in stride(from: end - 1, through: 0, by: -1) {
                if dp[start] && words.contains(String(s[start..<end])) {
                    dp[end] = true
                    break
                }
            }
        }
        return dp.last!
    }
}
