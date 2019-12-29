//
//  Q32_LongestParentheses.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

class LongestParentheses {
    
    // 2 pass: left <--> right
    // time: O(N), space: O(1)
    func longestValidParentheses(_ s: String) -> Int {
        var s = Array(s)
        var left = 0, right = 0, res = 0
        for c in s {
            if c == "(" { left += 1 }
            else { right += 1 }

            if left == right { res = max(res, left + right) }
            else if right > left { left = 0; right = 0 }
        }
        
        s.reverse()
        left = 0; right = 0
        for c in s {
            if c == "(" { left += 1 }
            else { right += 1 }
            
            if left == right { res = max(res, left + right) }
            else if left > right { left = 0; right = 0 }
        }
        return res

        /*
        let s = Array(s), n = s.count
        var ll = 0, lr = 0, rl = 0, rr = 0, res = 0

        for i in 0..<n {
            if s[i] == "(" { ll += 1 }
            else { lr += 1 }
            if ll == lr { res = max(res, ll + lr) }
            else if lr > ll { ll = 0; lr = 0 }

            if s[n-1-i] == "(" { rl += 1 }
            else { rr += 1 }
            if rl == rr { res = max(res, rl + rr) }
            else if rl > rr { rl = 0; rr = 0 }
        }
        return res
        */
    }
}
