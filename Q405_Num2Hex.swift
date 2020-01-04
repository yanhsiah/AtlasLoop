//
//  Q405_Num2Hex.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/3.
//

import Foundation

class Solution {
    
    // N: # digits of num
    // time: O(N), space: O(1)
    let hex: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
    func toHex(_ num: Int) -> String {
        if num == 0 { return "0" }
 
        var num = num, res = ""
        if num < 0 { num = Int(UInt32.max) + num + 1 }
 
        while num != 0 {
            res.append(hex[num & 15])
            num >>= 4
        }
        return String(res.reversed())
    }
}
