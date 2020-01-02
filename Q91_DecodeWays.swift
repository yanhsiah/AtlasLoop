//
//  Q91_DecodeWays.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class DecodeWays {
    // s = "102213"
    // f(1) = 1
    // f(10) = 1
    // f(102) = [f(10)f(2)] + [f(1)f(02)] = 1 + 0 = 1
    // f(1022) = [f(102)f(2)] + [f(10)f(22)] = 1 + 1 = 2
    // f(10221) = [f(1022)f(1)] + [f(102)f(21)] = 2 + 1 = 3
    // f(102213) = [f(10221)f(3)] + [f(1022)f(13)] = 3 + 2 = 5

    // time: O(N), space: O(1)
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        if s[0] == "0" { return 0 }
        if s.count == 1 { return 1 }
        
        var dp1 = 1, dp2 = 1
        for i in 1..<s.count {
            let num1 = Int(String(s[i..<i+1]))!
            let num2 = Int(String(s[i-1..<i+1]))!
            var dp = 0
            if 0 < num1 && num1 <= 9 { dp += dp1 }
            if 10 <= num2 && num2 <= 26 { dp += dp2 }
            
            dp2 = dp1
            dp1 = dp
        }
        return dp1
    }
}
