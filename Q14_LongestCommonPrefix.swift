//
//  Q14_LongestCommonPrefix.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class LongestCommonPrefix {
    // time: O(NL), space: O(L)
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var s1 = Array(strs[0]), end = s1.count
        for str in strs {
            let s2 = Array(str)

            var i = 0
            while i < min(end, s2.count) {
                if s1[i] != s2[i] { break }
                i += 1
            }
            end = i
            if end == 0 { return "" }
        }
        return String(s1[0..<end])
    }
}
