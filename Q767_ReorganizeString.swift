//
//  Q767_ReorganizeString.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class ReorganizeString {
    // time: O(L), space: O(1)
    func reorganizeString(_ S: String) -> String {
        let n = S.count
        guard n > 1 else { return S }
        
        var counts = Dictionary(S.map { ($0, 1) }, uniquingKeysWith: +)
        let (ch, count) = counts.max { $0.1 < $1.1 }!
        if count > (n + 1) / 2 { return "" }
        
        var res = Array(repeating: Character(" "), count: n)
        var i = 0
        for _ in 0..<count {
            res[i] = ch
            i += 2
        }
        counts[ch] = nil

        for (ch, count) in counts {
            for _ in 0..<count {
                if i >= n { i = 1 }
                res[i] = ch
                i += 2
            }
        }
        return String(res)
    }

    // "aabbcc"
    // ["b": 2, "c": 2, "a": 2]
    // ["b", " ", "b", " ", " ", " "]
    // ["b", "c", "b", " ", "c", " "]
    // ["b", "c", "b", "a", "c", "a"]
}
