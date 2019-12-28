//
//  Q161_OneEditDistance.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class OneEditDistance {
    // time: O(N), space: O(N)
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        let s = Array(s), t = Array(t)
        let m = s.count, n = t.count
        for i in 0..<min(m, n) {
            if s[i] != t[i] {
                var i1 = i, i2 = i
                if m == n { i1 += 1; i2 += 1 }
                else if m < n { i2 += 1 }
                else { i1 += 1 }
                
                
                let count = m - i1
                if n - i2 != count { return false }
                for j in 0..<count where s[i1+j] != t[i2+j] { return false }
                return true
            }
        }
        return abs(m - n) == 1
    }
}
