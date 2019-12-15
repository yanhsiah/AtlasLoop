//
//  Q67_AddBinary.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/14.
//

import Foundation

class AddBinary {
    // time: O(max(A, B)), space: O(A + B)
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a), b = Array(b)
        var res = ""
        var i = a.count - 1, j = b.count - 1, carry = 0
        while i >= 0 || j >= 0 || carry > 0 {
            if i >= 0 { carry += Int(String(a[i]))!; i -= 1 }
            if j >= 0 { carry += Int(String(b[j]))!; j -= 1 }
            res.append(String(carry % 2))
            carry /= 2
        }
        return String(res.reversed())
    }
}
