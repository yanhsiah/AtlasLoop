//
//  Q76_MinWindowSubstring.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

class MinWindowSubstring {
    // https://swift.org/blog/utf8-string/
    // time: O(S+T), space: O(S+T)
    func minWindow(_ s: String, _ t: String) -> String {
        let str = Array(s)
        let s = s.utf8.map { Int($0) }
        let t = t.utf8.map { Int($0) }

        var counts = Array(repeating: 0, count: 128)
        for c in t { counts[c] += 1 }
        
        var start = 0, end = 0, match = 0
        var pos = 0, len = s.count + 1
        while end < s.count {
            if counts[s[end]] > 0 { match += 1 }
            counts[s[end]] -= 1
            end += 1
            
            while match == t.count {
                if end - start < len {
                    len = end - start
                    pos = start
                }
                if counts[s[start]] == 0 { match -= 1 }
                counts[s[start]] += 1
                start += 1
            }
        }
        return len > s.count ? "" : String(str[pos..<pos + len])
        
        
        /*
        let s = Array(s)
        let t = Array(t)
        var counts = [Character:  Int]()
        for c in t { counts[c, default: 0] += 1 }
        
        var start = 0, end = 0, match = 0
        var pos = 0, len = s.count + 1
        while end < s.count {
            if counts[s[end], default: 0] > 0 { match += 1 }
            counts[s[end], default: 0] -= 1
            end += 1
            
            while match == t.count {
                if end - start < len {
                    len = end - start
                    pos = start
                }
                if counts[s[start], default: 0] == 0 { match -= 1 }
                counts[s[start], default: 0] += 1
                start += 1
            }
        }
        return len > s.count ? "" : String(s[pos..<pos + len])
        */
    }
}
