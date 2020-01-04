//
//  Q249_GroupShiftedStrings.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class Solution {
    
    // time: O(NL), space: O(NL)
    func groupStrings(_ strings: [String]) -> [[String]] {
        var groups = [String: [String]]()
        for s in strings { groups[shift(s), default: []].append(s) }

        return groups.values.map { $0.sorted() }
    }

    let a = Int(Character("a").asciiValue!)
    func shift(_ s: String) -> String {
        var res = ""
        let s = s.utf8.map { Int($0) }
        for i in 1..<s.count {
            let diff = (s[i] - s[i-1] + 26) % 26
            res.append(Character(Unicode.Scalar(a + diff)!))
        }
        return res
    }
}
