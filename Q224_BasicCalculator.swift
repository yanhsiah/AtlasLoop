//
//  Q224_BasicCalculator.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/15.
//

import Foundation

class BasicCalculator {
    
    // time & space: O(N)
    func calculate(_ s: String) -> Int {
        var res = 0, stk = [Int](), sum = 0, sign = 1
        for c in s {
            if c.isNumber {
                sum = 10 * sum + Int(String(c))!
            } else if c == "+" {
                res += sign * sum
                sign = 1
                sum = 0
            } else if c == "-" {
                res += sign * sum
                sign = -1
                sum = 0
            } else if c == "(" {
                stk.append(res)
                stk.append(sign)
                sign = 1
                res = 0
            } else if c == ")" {
                res += sign * sum
                res *= stk.removeLast()
                res += stk.removeLast()
                sign = 1
                sum = 0
            }
        }
        return res + sign * sum
    }
}
