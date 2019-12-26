//
//  Q246_Strobogrammatic.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/26.
//

import Foundation

class Strobogrammatic {
    
    // time: O(N), space: O(1)

    let sbg: [Character: Character] = ["0": "0", "1": "1", "8": "8", "6": "9", "9": "6"]
    func isStrobogrammatic(_ num: String) -> Bool {
        let num = Array(num)
        var start = 0, end = num.count - 1
        while start <= end {
            guard let right = sbg[num[start]], right == num[end] else { return false }
            start += 1
            end -= 1
        }
        return true
    }
}
