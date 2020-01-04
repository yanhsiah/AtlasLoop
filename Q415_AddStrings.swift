//
//  Q415_AddStrings.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class AddStrings {
    // time & space: O(N1 + N2)
    func addStrings(_ num1: String, _ num2: String) -> String {
        let a = Array(num1), b = Array(num2)
        var res = ""
        var i = a.count - 1, j = b.count - 1, carry = 0
        while i >= 0 || j >= 0 || carry > 0 {
            if i >= 0 { carry += Int(String(a[i]))!; i -= 1 }
            if j >= 0 { carry += Int(String(b[j]))!; j -= 1 }
            res.append(String(carry % 10))
            carry /= 10
        }
        return String(res.reversed())
    }
}
