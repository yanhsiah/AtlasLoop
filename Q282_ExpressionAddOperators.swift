//
//  Q282_ExpressionAddOperators.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/17.
//

import Foundation

// 494

class ExpressionAddOperators {
    // time: O(4^N), space: O(N)
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        guard num.count > 0 else { return res }
        let num = Array(num)
        dfs(&res, "", 0, num, target, 0, 0)
        return res
    }
    func dfs(_ res: inout [String], _ s: String, _ start: Int, _ num: [Character], _ target: Int, _ sum: Int, _ diff: Int) {
        if start == num.count {
            if sum == target { res.append(s) }
            return
        }
        var v = 0
        for i in start..<num.count {
            if num[start] == "0" && i > start { break }
            guard let d = Int(String(num[i])) else { break }
            v = 10 * v + d
            if start > 0 {
                dfs(&res, s + "+" + String(v), i + 1, num, target, sum + v, v)
                dfs(&res, s + "-" + String(v), i + 1, num, target, sum - v, -v)
                dfs(&res, s + "*" + String(v), i + 1, num, target, sum - diff + diff * v, diff * v)
            } else {
                dfs(&res, s + String(v), i + 1, num, target, v, v)
            }
        }
    }
}
