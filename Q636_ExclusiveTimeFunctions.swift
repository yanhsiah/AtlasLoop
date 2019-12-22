//
//  Q636_ExclusiveTimeFunctions.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class ExclusiveTimeFunctions {
    // time: O(N), space: O(N)
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var res = [Int](repeating: 0, count: n)
        var stk = [Int]()
        var prev = 0
        for log in logs {
            let tokens = log.split(separator: ":")
            guard tokens.count == 3, let fid = Int(tokens[0]), var ts = Int(tokens[2]) else { continue }
            if tokens[1] == "start" {
                if !stk.isEmpty { res[stk.last!] += ts - prev }
                stk.append(fid)
            } else {
                ts += 1
                res[fid] += ts - prev
                stk.removeLast()
            }
            prev = ts
        }
        return res
    }
}
