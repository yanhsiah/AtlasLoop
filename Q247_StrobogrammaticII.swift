//
//  Q247_StrobogrammaticII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class Solution {
    
    // time: O(5^(N/2))
    // space: O(N), recursion, not consider output space

    var left: [Character] = ["0","1","8","6","9"]
    var right: [Character] = ["0","1","8","9","6"]
    func findStrobogrammatic(_ n: Int) -> [String] {
        var res = [String]()
        var s = Array(repeating: Character(" "), count: n)
        dfs(&res, &s, 0, n-1)
        return res
    }
    
    func dfs(_ res: inout [String], _ s: inout [Character], _ start: Int, _ end: Int) {
        if start > end {
            res.append(String(s))
        } else if start == end {
            for i in 0..<3 {
                s[start] = left[i]
                res.append(String(s))
            }
        } else {
            for i in (start == 0 ? 1 : 0)..<5 {
                s[start] = left[i]
                s[end] = right[i]
                dfs(&res, &s, start+1, end-1)
            }
        }
    }
}
