//
//  Q301_RemoveInvalidParentheses.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/14.
//

import Foundation

class RemoveInvalidParentheses {
    
    // Bottom up solution (DFS)
    // T: O(2^N), N parentheses, each has two options (remove/append)
    // S: O(N), N recursive stack levels, each has O(1)
    func removeInvalidParentheses(_ s: String) -> [String] {
        var leftRm = 0, rightRm = 0
        let s = Array(s)
        for c in s {
            if c == "(" { leftRm += 1 }
            else if c == ")" {
                if leftRm > 0 { leftRm -= 1 }
                else { rightRm += 1 }
            }
        }

        var vss = Set<String>()
        var vs = ""
        helper(s, 0, 0, 0, leftRm, rightRm, &vs, &vss)
        return Array(vss)
    }
    func helper(_ s: [Character], _ i: Int, _ l: Int, _ r: Int, _ leftRm: Int, _ rightRm: Int, _ vs: inout String, _ vss: inout Set<String>) {
        if i == s.count {
            if leftRm == 0 && rightRm == 0 { vss.insert(vs) }
            return
        }

        let c = s[i]
        if leftRm > 0 && c == "(" { helper(s, i+1, l, r, leftRm-1, rightRm, &vs, &vss) }
        if rightRm > 0 && c == ")" { helper(s, i+1, l, r, leftRm, rightRm-1, &vs, &vss) }

        vs.append(c)
        if c != "(" && c != ")" { helper(s, i+1, l, r, leftRm, rightRm, &vs, &vss) }
        else if c == "(" { helper(s, i+1, l+1, r, leftRm, rightRm, &vs, &vss) }
        else if r < l { helper(s, i+1, l, r+1, leftRm, rightRm, &vs, &vss) }
        vs.removeLast()
    }
}
