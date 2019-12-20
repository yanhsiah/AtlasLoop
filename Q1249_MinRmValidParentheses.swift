//
//  Q1249_MinRmValidParentheses.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/19.
//

import Foundation

class MinRmValidParentheses {
    // time: O(N), space: O(N)
    func minRemoveToMakeValid(_ s: String) -> String {
        var stk = [Int]()
        var s = Array(s)
        for i in 0..<s.count {
            if s[i] == "(" { stk.append(i) }
            else if s[i] == ")" {
                if !stk.isEmpty { stk.removeLast() }
                else { s[i] = "*" }
            }
        }
        for i in stk { s[i] = "*" }
        
        var res = ""
        for c in s {
            if c != "*" { res.append(c) }
        }
        return res
    }
}
