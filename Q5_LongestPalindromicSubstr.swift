//
//  Q5_LongestPalindromicSubstr.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/12.
//

import Foundation

class LongestPalindromicSubstr {
    // time: O(N^2), space: O(1)
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 { return s }
        let s = Array(s)
        
        var pos = 0, len = 0
        for i in 0..<s.count {
            extend(s, i, i, &pos, &len)
            extend(s, i, i + 1, &pos, &len)
        }
        return String(s[pos..<pos + len])
    }
    func extend(_ s: [Character], _ l: Int, _ r: Int, _ pos: inout Int, _ len: inout Int) {
        var l = l, r = r
        while l >= 0 && r < s.count && s[l] == s[r] { l -= 1; r += 1 }
        let d = r - l - 1 // r and l are both invalid, don't count
        if d > len { pos = l + 1; len = d }
    }
}
