//
//  Q65_ValidNumber.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class ValidNumber {
    // time: O(N), space: O(N)
    func isNumber(_ s: String) -> Bool {
        let s = Array(s)
        var start = 0, end = s.count - 1
        while start < end && s[start] == " " { start += 1 }
        while start < end && s[end] == " " { end -= 1 }
        
        var num = false, point = false, e = false, eNum = false
        for i in start...end {
            if s[i] >= "0" && s[i] <= "9" {
                if e { eNum = true }
                else { num = true }
            } else if s[i] == "." {
                if point || e { return false }
                point = true
            } else if s[i] == "e" {
                if e || !num { return false }
                e = true
            } else if s[i] == "-" || s[i] == "+" {
                if i == start || s[i - 1] == "e" { continue }
                else { return false }
            } else {
                return false
            }
        }
        return num && (!e || e && eNum)
    }
}
