//
//  Q1234_ReplaceForBalancedString.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class ReplaceForBalancedString {
    // time: O(N), space: O(1)
    func balancedString(_ s: String) -> Int {
        let s = Array(s)
        var counts = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
        var k = s.count / 4

        var start = 0, end = 0
        var res = s.count + 1
        
        while end < s.count {
            counts[s[end]]! -= 1
            end += 1
            while start < s.count && canBalance(counts, k) {
                res = min(res, end - start)
                counts[s[start]]! += 1
                start += 1
            }
        }
        return res
    }
    func canBalance(_ counts: [Character: Int], _ k: Int) -> Bool {
        for count in counts.values where count > k { return false }
        return true
    }
    
    // "QQQR"
    // counts = ["Q": 2, "R": 1], end = 1
    // counts = ["Q": 1, "R": 1], end = 2
    // res = 2, counts = ["Q": 2, "R": 1], start = 1
    // counts = ["Q": 1, "R": 1], end = 3
    // res = 2, counts = ["Q": 2, "R": 1], start = 2
    // counts = ["Q": 2, "R": 0], end = 4

    // "QWER"
    // counts = ["W": 1, "R": 1, "E": 1, "Q": 0], end = 1
    // res = 1, counts = ["W": 1, "R": 1, "E": 1, "Q": 1], start = 1
    // res = 0, counts = ["W": 2, "R": 1, "E": 1, "Q": 1], start = 2
    // counts = ["W": 1, "R": 1, "E": 1, "Q": 1], end = 2
    // res = 0, counts = ["W": 1, "R": 1, "E": 2, "Q": 1], start = 3
    // counts = ["W": 1, "R": 1, "E": 1, "Q": 1], end = 3
    // res = 0, counts = ["W": 1, "R": 2, "E": 1, "Q": 1], start = 4
    // counts = ["W": 1, "R": 1, "E": 1, "Q": 1], end = 4
}
