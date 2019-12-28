//
//  Q29_DivideIntegers.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class DivideIntegers {

    // time: O(logN), space: O(1)
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isPositive = (dividend > 0) == (divisor > 0)
        var dvd = abs(dividend), dvs = abs(divisor)
        var res = 0
        while dvd >= dvs {
            var shift = 0
            while dvd >= (dvs << shift) { shift += 1 }
            dvd -= dvs << (shift - 1)
            res += 1 << (shift - 1)
        }
        return isPositive ? min(res, Int(Int32.max)) : res * -1
    }
}
