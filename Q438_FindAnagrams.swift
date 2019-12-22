//
//  Q438_FindAnagrams.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class Solution {
    // time: O(S+P), space: O(S+P)
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = s.utf8.map { Int($0) }
        let p = p.utf8.map { Int($0) }
        
        var counts = [Int](repeating: 0, count: 128)
        for c in p { counts[c] += 1 }
        
        var start = 0, end = 0, match = 0
        var res = [Int]()
        while end < s.count {
            if counts[s[end]] > 0 { match += 1 }
            counts[s[end]] -= 1
            end += 1
            while match == p.count {
                if end - start == match { res.append(start) }
                if counts[s[start]] == 0 { match -= 1 }
                counts[s[start]] += 1
                start += 1
            }
        }
        return res
    }
}
