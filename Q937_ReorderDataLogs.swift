//
//  Q937_ReorderDataLogs.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/12.
//

import Foundation

class ReorderDataLogs {
    
    // time: O(NlogN), space: O(N)

    typealias Data = (String, String, Int)
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var res = [String](), dataArray = [Data]()
        for (index, log) in logs.enumerated() {
            let s = Array(log)
            var i = 0
            while s[i] != " " { i += 1 }
            i += 1
            if s[i].isNumber {
                res.append(log)
            } else {
                dataArray.append((String(s[0..<i]), String(s[i..<s.count]), index))
            }
        }
        return dataArray.sorted { d1, d2 in
            let (id1, log1, i1) = d1, (id2, log2, i2) = d2
            return log1 != log2 ? log1 < log2 : id1 < id2
        }.map { logs[$0.2] } + res
    }
}
