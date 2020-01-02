//
//  Q921_MinAddParentheses.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class MinAddParentheses {
    
    // time: O(N), space: O(1)
    func minAddToMakeValid(_ S: String) -> Int {
        var res = 0, balance = 0
        for c in S {
            balance += c == "(" ? 1 : -1
            
            // balance >= -1
            if balance == -1 {
                res += 1
                balance += 1
            }
        }
        return res + balance
    }
}
